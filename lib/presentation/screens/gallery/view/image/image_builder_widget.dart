import 'package:ceit_alumni/data/models/gallery/index.dart';
import 'package:ceit_alumni/presentation/screens/gallery/cubit/gallery_cubit.dart';
import 'package:ceit_alumni/presentation/screens/gallery/index.dart';
import 'package:ceit_alumni/presentation/screens/gallery/view/media_gallery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageBuilderWidget extends StatefulWidget {
  ImageBuilderWidget({
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
  _ImageBuilderWidgetState createState() => _ImageBuilderWidgetState();
}

class _ImageBuilderWidgetState extends State<ImageBuilderWidget> {
  bool onHover = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GalleryCubit, int>(
      builder: (context, state) {
        final selected = widget.index == state;
        if (selected) {
          onHover = false;
        }
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
                    MediaGallery.galleryRoute +
                        GalleryMediaFullscreen.mediaGalleryRoute +
                        '/' +
                        widget.media.name,
                    arguments: GalleryMediaArguments(
                      url: widget.media.url,
                    ),
                  );
                } else {
                  context.read<GalleryCubit>().jump(widget.index);
                  widget.onTap();
                }
              },
              child: Hero(
                tag: widget.media.url,
                child: AnimatedContainer(
                  duration: widget.selectionAnimationDuration,
                  curve: widget.selectionAnimationCurve,
                  height: selected
                      ? widget.selectedHeight
                      : widget.unSelectedHeight,
                  child: Stack(
                    fit: StackFit.passthrough,
                    children: [
                      Image.network(
                        widget.media.url,
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
                      Positioned.fill(
                        child: AnimatedOpacity(
                          opacity: selected ? 0.0 : 1.0,
                          duration: widget.selectionAnimationDuration,
                          curve: widget.selectionAnimationCurve,
                          child: AnimatedOpacity(
                            opacity: onHover ? 0.0 : 1.0,
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
      onHover = true;
    });
  }

  void _onMouseExit(PointerEvent details) {
    setState(() {
      onHover = false;
    });
  }
}
