import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/gallery_localizations.dart';
import 'package:gallery/presentation/screens/album/view/media/cubit/media_cubit.dart';
import 'package:gallery/presentation/screens/album/view/media/view/media_preview.dart';
import 'package:gallery/presentation/screens/routers/index.dart';
import 'package:gallery_service/gallery_service.dart';

import 'page_button.dart';
import 'settings.dart';

const selectionAnimationDuration = Duration(milliseconds: 500);
const selectionAnimationCurve = Curves.easeInToLinear;
const viewportFraction = 0.2;
const initialPageIndex = 0;

class MediaWidget extends StatefulWidget {
  MediaWidget({
    required this.medias,
    required this.onRouteChanged,
  });

  final List<Media> medias;
  final HandleRouteChangedFunction onRouteChanged;

  @override
  _MediaWidgetState createState() => _MediaWidgetState();
}

class _MediaWidgetState extends State<MediaWidget>
    with
        SingleTickerProviderStateMixin,
        AutomaticKeepAliveClientMixin<MediaWidget> {
  @override
  bool get wantKeepAlive => true;

  late final ScrollController scrollController;
  late final PageController imagePageController;
  bool _gridView = true;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    imagePageController = PageController(
      initialPage: initialPageIndex,
      viewportFraction: viewportFraction,
      keepPage: true,
    );
  }

  @override
  void dispose() {
    imagePageController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final deviceHeight = MediaQuery.of(context).size.height;
    final selectedHeight = deviceHeight * 0.6;
    final unSelectedHeight = deviceHeight * 0.4;

    Widget mediaItemBuilder(int index) => BlocBuilder<MediaCubit, int>(
          builder: (context, state) {
            final isSelected = index == state;
            final containerHeight =
                isSelected ? selectedHeight : unSelectedHeight;
            final onTap = () => _animateToPage(index);
            return MediaPreviewWidget(
              index: index,
              gridView: _gridView,
              isVideoType: widget.medias[index].type == MediaType.video,
              isSelected: isSelected,
              media: widget.medias[index],
              containerHeight: containerHeight,
              selectionAnimationDuration: selectionAnimationDuration,
              selectionAnimationCurve: selectionAnimationCurve,
              onTap: onTap,
              onRouteChanged: widget.onRouteChanged,
            );
          },
        );
    return BlocProvider(
      create: (context) => MediaCubit(initialPageIndex),
      child: BlocBuilder<MediaCubit, int>(
        builder: (context, state) => Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
          floatingActionButton: widget.medias.isEmpty
              ? null
              : SettingsWidget(
                  scrollController: scrollController,
                  gridView: _gridView,
                  onGridViewIconTap: () =>
                      setState(() => _gridView = !_gridView),
                  onJumpIconTap: () => scrollController.animateTo(
                    0,
                    duration: selectionAnimationDuration,
                    curve: selectionAnimationCurve,
                  ),
                ),
          body: widget.medias.isEmpty
              ? Center(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 2.0),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: const BorderRadius.all(
                        Radius.elliptical(50, 50),
                      ),
                    ),
                    child: Text(GalleryLocalizations.of(context)!.noMedia),
                  ),
                )
              : _gridView
                  ? GridView.extent(
                      key: const PageStorageKey('Grid'),
                      controller: scrollController,
                      maxCrossAxisExtent: deviceHeight * 0.4,
                      children: widget.medias
                          .map<Widget>((media) =>
                              mediaItemBuilder(widget.medias.indexOf(media)))
                          .toList(),
                    )
                  : Stack(
                      children: [
                        PageView.builder(
                          key: const PageStorageKey('Page'),
                          itemCount: widget.medias.length,
                          controller: imagePageController,
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (index) =>
                              BlocProvider.of<MediaCubit>(context).jump(index),
                          itemBuilder: (context, index) =>
                              mediaItemBuilder(index),
                        ),
                        PageButton(
                          show: state > 0,
                          isEnd: false,
                          onTap: () {
                            if (state > 0) {
                              final index = state - 1;
                              BlocProvider.of<MediaCubit>(context).previous();
                              _animateToPage(index);
                            }
                          },
                        ),
                        PageButton(
                          show: state < widget.medias.length - 1,
                          isEnd: true,
                          onTap: () {
                            if (state < widget.medias.length) {
                              final index = state + 1;
                              BlocProvider.of<MediaCubit>(context).next();
                              _animateToPage(index);
                            }
                          },
                        ),
                      ],
                    ),
        ),
      ),
    );
  }

  void _animateToPage(int index) {
    if (imagePageController.hasClients) {
      imagePageController.animateToPage(
        index,
        duration: selectionAnimationDuration,
        curve: selectionAnimationCurve,
      );
    }
  }
}
