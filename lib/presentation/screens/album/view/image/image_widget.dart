import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/presentation/screens/album/view/album.dart';
import 'package:gallery/presentation/screens/album/view/media/cubit/media_cubit.dart';
import 'package:gallery/presentation/screens/fullscreen/fullscreen.dart';
import 'package:gallery_service/gallery_service.dart';

class ImageWidget extends StatefulWidget {
  ImageWidget({
    @required this.index,
    @required this.isSelected,
    @required this.media,
    @required this.containerHeight,
    @required this.selectionAnimationDuration,
    @required this.selectionAnimationCurve,
    @required this.onTap,
    this.stackedWidget,
  });

  final int index;
  final bool isSelected;
  final Media media;
  final double containerHeight;
  final Duration selectionAnimationDuration;
  final Curve selectionAnimationCurve;
  final VoidCallback onTap;
  final List<Widget> stackedWidget;

  @override
  _ImageWidgetState createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  bool _onHover = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 10.0,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: InkWell(
          onTap: () {
            if (widget.isSelected) {
              Navigator.of(context).pushNamed(
                AlbumPage.albumRoute +
                    MediaFullscreen.fullscreenRoute +
                    '/' +
                    widget.media.name,
                arguments: MediaFullscreenArguments(media: widget.media),
              );
            } else {
              BlocProvider.of<MediaCubit>(context).jump(widget.index);
              widget.onTap();
            }
          },
          child: Hero(
            tag: widget.media.thumbnail,
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
                        duration: const Duration(seconds: 2),
                        curve: Curves.easeOut,
                      );
                    },
                  ),
                  Positioned.fill(
                    child: AnimatedOpacity(
                      opacity: widget.isSelected ? 0.0 : 1.0,
                      duration: widget.selectionAnimationDuration,
                      curve: widget.selectionAnimationCurve,
                      child: AnimatedOpacity(
                        opacity: _onHover || widget.isSelected ? 0.0 : 1.0,
                        duration: const Duration(milliseconds: 250),
                        child: MouseRegion(
                          onEnter: _onMouseEnter,
                          onExit: _onMouseExit,
                          child: Opacity(
                            opacity: 0.6,
                            child: Container(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (widget.stackedWidget != null)
                    for (Widget widget in widget.stackedWidget) widget
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
