import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:layout_service/layout_service.dart';
import 'package:video_service/video_service.dart';

import 'video_progress_slider.dart';

class VideoControlsOverlay extends StatefulWidget {
  const VideoControlsOverlay({
    Key? key,
    required this.videoState,
    required this.isFullscreen,
    required this.handleFullscreenButton,
  }) : super(key: key);

  final VideoState videoState;
  final bool isFullscreen;
  final VoidCallback handleFullscreenButton;

  @override
  _VideoControlsOverlayState createState() => _VideoControlsOverlayState();
}

class _VideoControlsOverlayState extends State<VideoControlsOverlay>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<VideoBloc>(context).animationController =
        AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
      reverseDuration: const Duration(milliseconds: 250),
    );
  }

  @override
  Widget build(BuildContext context) {
    final animationController =
        BlocProvider.of<VideoBloc>(context).animationController;
    const horizontalPadding = 8.0;
    const verticalPadding = 8.0;
    final textTheme =
        Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.white);
    final backIcon = Container(
      alignment: Alignment.topLeft,
      child: const BackButton(color: Colors.white),
    );
    final fullscreenIcon = Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: InkWell(
        onTap: () => widget.handleFullscreenButton(),
        child: Container(
          child: Icon(
            widget.isFullscreen ? Icons.fullscreen_exit : Icons.fullscreen,
            color: Colors.white,
          ),
        ),
      ),
    );

    Widget playPauseIcon(double iconSize) => MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              if (widget.videoState.isPlaying) {
                animationController.forward();
                widget.videoState.videoPlayerController!.pause();
              } else {
                animationController.reverse();
                widget.videoState.videoPlayerController!.play();
              }
            },
            child: Center(
              child: AnimatedIcon(
                icon: AnimatedIcons.pause_play,
                progress: animationController,
                color: Colors.white,
                size: iconSize,
              ),
            ),
          ),
        );

    return Directionality(
      textDirection: TextDirection.ltr,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: !widget.videoState.isShowingController
            ? const SizedBox.shrink()
            : GestureDetector(
                onTap: () {
                  if (isLargeDisplay(context)) {
                    if (widget.videoState.isPlaying) {
                      animationController.forward();
                      widget.videoState.videoPlayerController!.pause();
                      BlocProvider.of<VideoBloc>(context)
                          .add(const PersistShowingControllerRequested());
                    } else {
                      animationController.reverse();
                      widget.videoState.videoPlayerController!.play();
                      BlocProvider.of<VideoBloc>(context)
                          .add(const ToggleControllerRequested());
                    }
                  } else {
                    BlocProvider.of<VideoBloc>(context)
                        .add(const ToggleControllerRequested());
                  }
                },
                child: MouseRegion(
                  onHover: _onMouseHover,
                  onExit: _onMouseExit,
                  child: AdaptiveSize(
                    large: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        backIcon,
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            VideoProgressSlider(),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: horizontalPadding,
                                vertical: verticalPadding,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      playPauseIcon(30.0),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: horizontalPadding,
                                          vertical: verticalPadding,
                                        ),
                                        child: Text(
                                          '${widget.videoState.positionText}'
                                          ' / ${widget.videoState.durationText}',
                                          style: textTheme,
                                        ),
                                      ),
                                    ],
                                  ),
                                  fullscreenIcon,
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    medium: Container(
                      color: Colors.black26,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          backIcon,
                          playPauseIcon(100.0),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: horizontalPadding,
                              vertical: verticalPadding,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: horizontalPadding,
                                    vertical: verticalPadding,
                                  ),
                                  child: Text(
                                    widget.videoState.positionText,
                                    style: textTheme,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: verticalPadding,
                                      ),
                                      child: Text(
                                        widget.videoState.durationText,
                                        style: textTheme,
                                      ),
                                    ),
                                    fullscreenIcon,
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  void _onMouseHover(PointerEvent details) {
    BlocProvider.of<VideoBloc>(context)
        .add(const PersistShowingControllerRequested());
  }

  void _onMouseExit(PointerEvent details) {
    if (widget.videoState.isPlaying) {
      BlocProvider.of<VideoBloc>(context)
          .add(const ToggleControllerRequested());
    }
  }
}
