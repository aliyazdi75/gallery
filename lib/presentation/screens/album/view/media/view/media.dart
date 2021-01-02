import 'package:built_collection/built_collection.dart';
import 'package:ceit_alumni/data/models/gallery/index.dart';
import 'package:ceit_alumni/presentation/screens/album/view/image/image_builder_widget.dart';
import 'package:ceit_alumni/presentation/screens/album/view/media/cubit/media_cubit.dart';
import 'package:ceit_alumni/presentation/screens/album/view/video/video_builder_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

const _horizontalDesktopPadding = 81.0;
const _selectionAnimationDuration = Duration(milliseconds: 750);
const _selectionAnimationCurve = Curves.easeInToLinear;

class MediaWidget extends StatelessWidget {
  MediaWidget({
    @required this.medias,
  });

  final BuiltList<Media> medias;
  final itemScrollController = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    final initialScrollIndex = 0;
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    final selectedHeight = deviceHeight * 0.6;
    final unSelectedHeight = deviceHeight * 0.4;
    final kAlign = selectedHeight / deviceWidth / 2;

    return BlocProvider(
      create: (_) => MediaCubit(initialScrollIndex),
      child: Stack(
        children: [
          ScrollablePositionedList.builder(
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            initialScrollIndex: initialScrollIndex,
            initialAlignment: 0.5 -
                (kAlign *
                    medias[initialScrollIndex].width /
                    medias[initialScrollIndex].height),
            padding: const EdgeInsets.all(40.0),
            itemScrollController: itemScrollController,
            itemCount: medias.length,
            itemBuilder: (context, index) => medias[index].type == 'image'
                ? ImageBuilderWidget(
                    index: index,
                    media: medias[index],
                    selectedHeight: selectedHeight,
                    unSelectedHeight: unSelectedHeight,
                    selectionAnimationDuration: _selectionAnimationDuration,
                    selectionAnimationCurve: _selectionAnimationCurve,
                    onTap: () => _animatedScroll(kAlign, index, medias[index]),
                  )
                : VideoBuilderWidget(
                    index: index,
                    media: medias[index],
                    selectedHeight: selectedHeight,
                    unSelectedHeight: unSelectedHeight,
                    selectionAnimationDuration: _selectionAnimationDuration,
                    selectionAnimationCurve: _selectionAnimationCurve,
                    onTap: () => _animatedScroll(kAlign, index, medias[index]),
                  ),
          ),
          BlocBuilder<MediaCubit, int>(
            builder: (context, state) => _DesktopPageButton(
              show: state > 0,
              isEnd: false,
              onTap: () {
                if (state > 0) {
                  final index = state - 1;
                  context.read<MediaCubit>().previous();
                  _animatedScroll(kAlign, index, medias[index]);
                }
              },
            ),
          ),
          BlocBuilder<MediaCubit, int>(
            builder: (context, state) => _DesktopPageButton(
              show: state < medias.length - 1,
              isEnd: true,
              onTap: () {
                if (state < medias.length) {
                  final index = state + 1;
                  context.read<MediaCubit>().next();
                  _animatedScroll(kAlign, index, medias[index]);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void _animatedScroll(double kAlign, int index, Media media) {
    itemScrollController.scrollTo(
      index: index,
      duration: _selectionAnimationDuration,
      curve: _selectionAnimationCurve,
      alignment: 0.5 - (kAlign * media.width / media.height),
    );
  }
}

class _DesktopPageButton extends StatelessWidget {
  const _DesktopPageButton({
    Key key,
    @required this.isEnd,
    @required this.show,
    @required this.onTap,
  }) : super(key: key);

  final bool isEnd;
  final bool show;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    final buttonSize = 58.0;
    final padding = _horizontalDesktopPadding - buttonSize / 2;
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      child: show
          ? ExcludeSemantics(
              child: Align(
                alignment: isEnd
                    ? AlignmentDirectional.centerEnd
                    : AlignmentDirectional.centerStart,
                child: Container(
                  width: buttonSize,
                  height: buttonSize,
                  color: Colors.black.withOpacity(0.5),
                  margin: EdgeInsetsDirectional.only(
                    start: isEnd ? 0 : padding,
                    end: isEnd ? padding : 0,
                  ),
                  child: InkWell(
                    onTap: onTap,
                    child: Icon(
                      isEnd ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          : Container(),
    );
  }
}
