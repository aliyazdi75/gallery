import 'package:ceit_alumni/data/models/gallery/index.dart';
import 'package:ceit_alumni/presentation/screens/album/view/album.dart';
import 'package:ceit_alumni/presentation/screens/album/view/media/cubit/media_cubit.dart';
import 'package:ceit_alumni/presentation/screens/fullscreen/media/fullscreen_media.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const kIconSizeSelected = 0.6;
const kIconSizeUnselected = 0.25;

class VideoBuilderWidget extends StatefulWidget {
  VideoBuilderWidget({
    this.index,
    this.media,
    this.selectedHeight,
    this.unSelectedHeight,
    this.selectionAnimationDuration,
    this.selectionAnimationCurve,
    this.onTap,
  });

  final int index;
  final Media media;
  final double selectedHeight;
  final double unSelectedHeight;
  final Duration selectionAnimationDuration;
  final Curve selectionAnimationCurve;
  final VoidCallback onTap;

  @override
  _VideoBuilderWidgetState createState() => _VideoBuilderWidgetState();
}

class _VideoBuilderWidgetState extends State<VideoBuilderWidget> {
  bool _onHover = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediaCubit, int>(
      builder: (context, state) {
        final selected = widget.index == state;
        final playIconSize = selected
            ? widget.selectedHeight * kIconSizeSelected
            : widget.unSelectedHeight * kIconSizeUnselected;
        return Center(
          child: Card(
            elevation: 10.0,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: InkWell(
              onTap: () {
                if (selected) {
                  Navigator.of(context).pushNamed(
                    AlbumPage.albumRoute +
                        FullscreenMedia.fullscreenRoute +
                        '/' +
                        widget.media.name,
                    arguments: FullscreenMediaArguments(
                      url: widget.media.url,
                      thumbnail: widget.media.thumbnail,
                      isImage: false,
                    ),
                  );
                } else {
                  context.read<MediaCubit>().jump(widget.index);
                  widget.onTap();
                }
              },
              child: Hero(
                tag: widget.media.thumbnail,
                child: AnimatedContainer(
                  duration: widget.selectionAnimationDuration,
                  curve: widget.selectionAnimationCurve,
                  height: selected
                      ? widget.selectedHeight
                      : widget.unSelectedHeight,
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
                      Positioned.fill(
                        child: AnimatedOpacity(
                          opacity: selected || selected ? 0.0 : 1.0,
                          duration: widget.selectionAnimationDuration,
                          curve: widget.selectionAnimationCurve,
                          child: AnimatedOpacity(
                            opacity: _onHover ? 0.0 : 1.0,
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
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
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
