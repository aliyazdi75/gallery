import 'package:ceit_alumni/blocs/video/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/ceit_alumni_localizations.dart';
import 'package:video_player/video_player.dart';

import 'video_progress_slider.dart';

class VideoFullscreen extends StatelessWidget {
  VideoFullscreen({
    @required this.url,
    @required this.thumbnail,
    @required this.isFullscreen,
    @required this.handleFullscreenButton,
  });

  final String url;
  final String thumbnail;
  final bool isFullscreen;
  final VoidCallback handleFullscreenButton;
  final buttonSize = 58.0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<VideoBloc>(
      create: (context) => VideoBloc(),
      child: BlocListener<VideoBloc, VideoState>(
        listener: (context, state) async {
          switch (state.status) {
            case VideoStatus.failure:
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text(
                      CeitAlumniLocalizations.of(context).galleryFailure,
                    ),
                  ),
                );
              break;
            default:
              break;
          }
        },
        child: BlocBuilder<VideoBloc, VideoState>(
          builder: (context, state) {
            if (state.status == VideoStatus.initial) {
              context.watch<VideoBloc>().add(VideoInitialized(url));
            }
            return Hero(
              tag: thumbnail,
              child: Material(
                color: Colors.black,
                child: Center(
                  child: state.status == VideoStatus.initial
                      ? Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Image.network(
                              thumbnail,
                              fit: BoxFit.contain,
                            ),
                            Positioned.fill(
                              child: Opacity(
                                opacity: 0.3,
                                child: Container(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const Positioned.fill(
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: BackButton(color: Colors.white),
                              ),
                            ),
                            const LinearProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          ],
                        )
                      : AspectRatio(
                          aspectRatio: state.aspectRatio,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () => context
                                    .read<VideoBloc>()
                                    .add(const ToggleControllerRequested()),
                                child: VideoPlayer(state.videoPlayerController),
                              ),
                              // InkWell(
                              //   onTap: () => handleFullscreenButton,
                              //   child: Container(
                              //     width: buttonSize,
                              //     height: buttonSize,
                              //     child: Icon(
                              //       isFullscreen
                              //           ? Icons.fullscreen_exit
                              //           : Icons.fullscreen,
                              //       color: Colors.white,
                              //     ),
                              //   ),
                              // ),
                              // Positioned.fill(
                              //   child: Opacity(
                              //     opacity: 0.3,
                              //     child: Container(
                              //       color: Colors.black,
                              //     ),
                              //   ),
                              // ),
                              // const CircularProgressIndicator(
                              //   valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                              // ),
                              _ControlsOverlay(
                                videoState: state,
                                isFullscreen: isFullscreen,
                                handleFullscreenButton: handleFullscreenButton,
                              ),
                              VideoProgressSlider(),
                            ],
                          ),
                        ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _ControlsOverlay extends StatefulWidget {
  const _ControlsOverlay({
    Key key,
    @required this.videoState,
    @required this.isFullscreen,
    @required this.handleFullscreenButton,
  }) : super(key: key);

  final VideoState videoState;
  final bool isFullscreen;
  final VoidCallback handleFullscreenButton;

  @override
  __ControlsOverlayState createState() => __ControlsOverlayState();
}

class __ControlsOverlayState extends State<_ControlsOverlay>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    context.read<VideoBloc>().animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
      reverseDuration: const Duration(milliseconds: 250),
    );
  }

  @override
  Widget build(BuildContext context) {
    final animationController = context.watch<VideoBloc>().animationController;
    const horizontalPadding = 8.0;
    const verticalPadding = 8.0;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        // reverseDuration: const Duration(milliseconds: 200),
        child: !widget.videoState.isShowingController
            ? const SizedBox.shrink()
            : GestureDetector(
                onTap: () => context
                    .read<VideoBloc>()
                    .add(const ToggleControllerRequested()),
                child: Container(
                  color: Colors.black26,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: const BackButton(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (widget.videoState.isPlaying) {
                            animationController.forward();
                            widget.videoState.videoPlayerController.pause();
                          } else {
                            animationController.reverse();
                            widget.videoState.videoPlayerController.play();
                          }
                        },
                        child: Center(
                          child: AnimatedIcon(
                            icon: AnimatedIcons.play_pause,
                            progress: animationController,
                            color: Colors.white,
                            size: 100.0,
                          ),
                        ),
                      ),
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
                                style: Theme.of(context).textTheme.subtitle2,
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
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: horizontalPadding,
                                    vertical: verticalPadding,
                                  ),
                                  child: InkWell(
                                    onTap: () =>
                                        widget.handleFullscreenButton(),
                                    child: Container(
                                      child: Icon(
                                        widget.isFullscreen
                                            ? Icons.fullscreen_exit
                                            : Icons.fullscreen,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
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
    );
  }
}
