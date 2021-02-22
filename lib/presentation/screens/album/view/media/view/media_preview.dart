import 'package:flutter/material.dart';
import 'package:gallery_service/gallery_service.dart';
import 'package:layout_service/layout_service.dart';
import 'package:routers_service/routers_service.dart';

const kIconSizeSelected = 0.4;
const kIconSizeUnselected = 0.25;

class MediaPreviewWidget extends StatefulWidget {
  MediaPreviewWidget({
    required this.index,
    required this.gridView,
    required this.isVideoType,
    required this.isSelected,
    required this.media,
    required this.containerHeight,
    required this.selectionAnimationDuration,
    required this.selectionAnimationCurve,
    required this.onUnselectedTapped,
  });

  final int index;
  final bool gridView;
  final bool isVideoType;
  final bool isSelected;
  final Media media;
  final double containerHeight;
  final Duration selectionAnimationDuration;
  final Curve selectionAnimationCurve;
  final VoidCallback onUnselectedTapped;

  @override
  _MediaPreviewWidgetState createState() => _MediaPreviewWidgetState();
}

class _MediaPreviewWidgetState extends State<MediaPreviewWidget> {
  bool _onHover = false;

  @override
  Widget build(BuildContext context) {
    final playIconSize = widget.isSelected
        ? widget.containerHeight * kIconSizeSelected
        : widget.containerHeight * kIconSizeUnselected;
    final stackedWidget = [
      Positioned.fill(
        child: Opacity(
          opacity: 0.3,
          child: Container(
            color: Colors.black,
          ),
        ),
      ),
      TweenAnimationBuilder<double>(
        tween: Tween<double>(
          begin: playIconSize,
          end: playIconSize,
        ),
        duration: widget.selectionAnimationDuration,
        curve: widget.selectionAnimationCurve,
        builder: (context, size, child) {
          return Icon(
            Icons.play_circle_outline,
            color: Colors.white,
            size: size,
          );
        },
      ),
    ];
    return Center(
      child: Card(
        elevation: 10.0,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: InkWell(
          onTap: () {
            if (widget.isSelected || widget.gridView) {
              final browserState =
                  GalleryRouterStateScope.of(context)!.browserState!;
              final newState = browserState
                  .rebuild((b) => b..media = widget.media.toBuilder());
              final newPath = MediaFullscreenPath(
                  browserState.galleriesHistory.last, widget.media.path);
              GalleryRouterStateScope.of(context)!
                ..routePath = newPath
                ..browserState = newState;
            } else {
              widget.onUnselectedTapped();
            }
          },
          child: Hero(
            tag: widget.media.path,
            child: AnimatedContainer(
              duration: widget.selectionAnimationDuration,
              curve: widget.selectionAnimationCurve,
              height: widget.containerHeight,
              child: Stack(
                alignment: Alignment.center,
                fit: StackFit.passthrough,
                children: [
                  Image.network(
                    widget.media.thumbnail,
                    fit: BoxFit.fitHeight,
                    frameBuilder:
                        (context, child, frame, wasSynchronouslyLoaded) {
                      if (wasSynchronouslyLoaded) {
                        return child;
                      }
                      return AnimatedOpacity(
                        child: child,
                        opacity: frame == null ? 0 : 1,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeOut,
                      );
                    },
                  ),
                  if (widget.isVideoType)
                    for (Widget widget in stackedWidget) widget,
                  if (isDesktop())
                    Positioned.fill(
                      child: AnimatedOpacity(
                        opacity: widget.gridView
                            ? 1.0
                            : widget.isSelected
                                ? 0.0
                                : 1.0,
                        duration: widget.selectionAnimationDuration,
                        curve: widget.selectionAnimationCurve,
                        child: AnimatedOpacity(
                          opacity: _onHover ||
                                  (widget.isSelected && !widget.gridView)
                              ? 0.0
                              : 1.0,
                          duration: const Duration(milliseconds: 250),
                          child: MouseRegion(
                            onEnter: _onMouseEnter,
                            onExit: _onMouseExit,
                            child: Opacity(
                              opacity: 0.4,
                              child: Container(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onMouseEnter(PointerEvent details) {
    setState(() {
      _onHover = true;
    });
  }

  void _onMouseExit(PointerEvent details) {
    setState(() {
      _onHover = false;
    });
  }
}
