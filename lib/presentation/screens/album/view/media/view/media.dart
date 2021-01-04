import 'package:built_collection/built_collection.dart';
import 'package:ceit_alumni/data/models/gallery/index.dart';
import 'package:ceit_alumni/data/models/gallery/src/media_type.dart';
import 'package:ceit_alumni/presentation/layout/adaptive.dart';
import 'package:ceit_alumni/presentation/screens/album/view/image/image_widget.dart';
import 'package:ceit_alumni/presentation/screens/album/view/media/cubit/media_cubit.dart';
import 'package:ceit_alumni/presentation/screens/album/view/video/video_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/ceit_alumni_localizations.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'page_button.dart';

const selectionAnimationDuration = Duration(milliseconds: 750);
const selectionAnimationCurve = Curves.easeInToLinear;

class MediaWidget extends StatefulWidget {
  MediaWidget({@required this.medias});

  final BuiltList<Media> medias;

  @override
  _MediaWidgetState createState() => _MediaWidgetState();
}

class _MediaWidgetState extends State<MediaWidget> {
  final viewportFraction = 0.7;
  final initialScrollIndex = 0;
  int _scrolledIndex;
  ItemScrollController _itemScrollController;
  PageController _imagePageController;

  @override
  void initState() {
    _scrolledIndex = initialScrollIndex;
    _itemScrollController = ItemScrollController();
    _imagePageController = PageController(
      initialPage: initialScrollIndex,
      viewportFraction: viewportFraction,
      keepPage: true,
    );
    super.initState();
  }

  @override
  void dispose() {
    _imagePageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    final selectedHeight = deviceHeight * 0.6;
    final unSelectedHeight = deviceHeight * 0.4;
    final kAlign = selectedHeight / deviceWidth / 2;

    Widget mediaItemBuilder(int index) => BlocBuilder<MediaCubit, int>(
          builder: (context, state) {
            final isSelected = index == state;
            final containerHeight =
                isSelected ? selectedHeight : unSelectedHeight;
            final onTap =
                () => _animatedScroll(kAlign, index, widget.medias[index]);
            return widget.medias[index].type == MediaType.image
                ? ImageWidget(
                    index: index,
                    isSelected: isSelected,
                    media: widget.medias[index],
                    containerHeight: containerHeight,
                    selectionAnimationDuration: selectionAnimationDuration,
                    selectionAnimationCurve: selectionAnimationCurve,
                    onTap: onTap,
                  )
                : VideoImageWidget(
                    index: index,
                    isSelected: isSelected,
                    media: widget.medias[index],
                    containerHeight: containerHeight,
                    selectionAnimationDuration: selectionAnimationDuration,
                    selectionAnimationCurve: selectionAnimationCurve,
                    onTap: onTap,
                  );
          },
        );
    return BlocProvider(
      create: (_) => MediaCubit(initialScrollIndex),
      child: Stack(
        children: [
          widget.medias.isEmpty
              ? Center(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 2.0),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: const BorderRadius.all(
                        Radius.elliptical(50, 50),
                      ),
                    ),
                    child: Text(CeitAlumniLocalizations.of(context).noMedia),
                  ),
                )
              : AdaptiveSize(
                  large: ScrollablePositionedList.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    initialScrollIndex: initialScrollIndex,
                    initialAlignment: widget.medias.length > initialScrollIndex
                        ? 0.5 -
                            (kAlign *
                                widget.medias[initialScrollIndex].width /
                                widget.medias[initialScrollIndex].height)
                        : 0,
                    padding: const EdgeInsets.all(40.0),
                    itemScrollController: _itemScrollController,
                    itemCount: widget.medias.length,
                    itemBuilder: (context, index) => mediaItemBuilder(index),
                  ),
                  medium: PageView.builder(
                    key: PageStorageKey(_scrolledIndex),
                    itemCount: widget.medias.length,
                    controller: _imagePageController,
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => mediaItemBuilder(index),
                  ),
                ),
          BlocBuilder<MediaCubit, int>(
            builder: (context, state) => PageButton(
              show: state > 0,
              isEnd: false,
              onTap: () {
                if (state > 0) {
                  final index = state - 1;
                  BlocProvider.of<MediaCubit>(context).previous();
                  _animatedScroll(kAlign, index, widget.medias[index]);
                }
              },
            ),
          ),
          BlocBuilder<MediaCubit, int>(
            builder: (context, state) => PageButton(
              show: state < widget.medias.length - 1,
              isEnd: true,
              onTap: () {
                if (state < widget.medias.length) {
                  final index = state + 1;
                  BlocProvider.of<MediaCubit>(context).next();
                  _animatedScroll(kAlign, index, widget.medias[index]);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void _animatedScroll(double kAlign, int index, Media media) {
    if (isLargeDisplay(context)) {
      _itemScrollController.scrollTo(
        index: index,
        duration: selectionAnimationDuration,
        curve: selectionAnimationCurve,
        alignment: 0.5 - (kAlign * media.width / media.height),
      );
    }
    if (_imagePageController.hasClients) {
      _scrolledIndex = _imagePageController.page.floor();
      _imagePageController.animateToPage(
        index,
        duration: selectionAnimationDuration,
        curve: selectionAnimationCurve,
      );
    } else {
      _scrolledIndex = index;
      _imagePageController = PageController(
        initialPage: index,
        viewportFraction: viewportFraction,
        keepPage: true,
      );
    }
  }
}
