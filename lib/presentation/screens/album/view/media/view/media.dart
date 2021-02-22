import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/l10n/index.dart';
import 'package:gallery/presentation/screens/album/view/media/cubit/media_cubit.dart';
import 'package:gallery/presentation/screens/album/view/media/view/media_preview.dart';
import 'package:gallery_service/gallery_service.dart';
import 'package:layout_service/layout_service.dart';

import 'page_button.dart';
import 'settings.dart';

const selectionAnimationDuration = Duration(milliseconds: 500);
const selectionAnimationCurve = Curves.easeInToLinear;
const largeSizeViewportFraction = 0.2;
const smallSizeViewportFraction = 0.7;
const initialPageIndex = 0;

class MediaWidget extends StatefulWidget {
  MediaWidget({required this.medias});

  final List<Media> medias;

  @override
  _MediaWidgetState createState() => _MediaWidgetState();
}

class _MediaWidgetState extends State<MediaWidget>
    with
        SingleTickerProviderStateMixin,
        AutomaticKeepAliveClientMixin<MediaWidget> {
  @override
  bool get wantKeepAlive => true;

  late ScrollController _scrollController;
  late PageController _imagePageController;
  bool _gridView = true;
  bool _isLarge = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _imagePageController = PageController(
      initialPage: initialPageIndex,
      viewportFraction: smallSizeViewportFraction,
      keepPage: true,
    );
  }

  @override
  void dispose() {
    _imagePageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final deviceHeight = MediaQuery.of(context).size.height;
    final selectedHeight = deviceHeight * 0.6;
    final unSelectedHeight = deviceHeight * 0.4;

    _adaptivePageController(context);
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
              onUnselectedTapped: onTap,
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
                  scrollController: _scrollController,
                  gridView: _gridView,
                  onGridViewIconTap: () =>
                      setState(() => _gridView = !_gridView),
                  onJumpIconTap: () => _scrollTopAnimation(),
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
                      controller: _scrollController,
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
                          controller: _imagePageController,
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

  void _adaptivePageController(BuildContext context) {
    if (isLargeDisplay(context) && !_isLarge) {
      _isLarge = true;
      _imagePageController = PageController(
        initialPage: _imagePageController.hasClients
            ? _imagePageController.page!.floor()
            : initialPageIndex,
        viewportFraction: largeSizeViewportFraction,
        keepPage: true,
      );
    } else if (!isLargeDisplay(context) && _isLarge) {
      _isLarge = false;
      _imagePageController = PageController(
        initialPage: _imagePageController.hasClients
            ? _imagePageController.page!.floor()
            : initialPageIndex,
        viewportFraction: smallSizeViewportFraction,
        keepPage: true,
      );
    }
  }

  void _animateToPage(int index) {
    if (_imagePageController.hasClients) {
      _imagePageController.animateToPage(
        index,
        duration: selectionAnimationDuration,
        curve: selectionAnimationCurve,
      );
    }
  }

  void _scrollTopAnimation() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        0,
        duration: selectionAnimationDuration,
        curve: selectionAnimationCurve,
      );
    }
  }
}
