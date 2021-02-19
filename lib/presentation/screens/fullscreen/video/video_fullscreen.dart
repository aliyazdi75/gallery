import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/gallery_localizations.dart';
import 'package:gallery_service/gallery_service.dart';
import 'package:layout_service/layout_service.dart';
import 'package:video_player/video_player.dart';
import 'package:video_service/video_service.dart';

import 'video_controls_overlay.dart';
import 'video_progress_slider.dart';

class VideoFullscreen extends StatelessWidget {
  VideoFullscreen({
    required this.media,
    required this.isFullscreen,
    required this.handleFullscreenButton,
  });

  final Media media;
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
                      GalleryLocalizations.of(context)!.galleryFailure,
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
              BlocProvider.of<VideoBloc>(context)
                  .add(VideoInitialized(media.url));
            }
            return Hero(
              tag: media.path,
              child: Material(
                color: Colors.black,
                child: Center(
                  child: state.status == VideoStatus.initial
                      ? Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Image.network(
                              media.thumbnail,
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
                              VideoPlayer(state.videoPlayerController!),
                              MouseRegion(
                                onHover: (details) =>
                                    _onMouseHover(context, state),
                                onExit: (details) =>
                                    _onMouseExit(context, state),
                                child: GestureDetector(
                                  onTap: () {
                                    if (isLargeDisplay(context)) {
                                      if (state.isPlaying) {
                                        BlocProvider.of<VideoBloc>(context)
                                            .animationController
                                            .forward();
                                        state.videoPlayerController!.pause();
                                        BlocProvider.of<VideoBloc>(context).add(
                                            const PersistShowingControllerRequested());
                                      } else {
                                        BlocProvider.of<VideoBloc>(context)
                                            .animationController
                                            .reverse();
                                        state.videoPlayerController!.play();
                                        BlocProvider.of<VideoBloc>(context).add(
                                            const ToggleControllerRequested());
                                      }
                                    } else {
                                      BlocProvider.of<VideoBloc>(context).add(
                                          const ToggleControllerRequested());
                                    }
                                  },
                                ),
                              ),
                              VideoControlsOverlay(
                                videoState: state,
                                isFullscreen: isFullscreen,
                                handleFullscreenButton: handleFullscreenButton,
                              ),
                              if (isMediumDisplay(context))
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

  void _onMouseHover(BuildContext context, VideoState state) {
    BlocProvider.of<VideoBloc>(context)
        .add(const PersistShowingControllerRequested());
  }

  void _onMouseExit(BuildContext context, VideoState state) {
    if (state.isPlaying) {
      BlocProvider.of<VideoBloc>(context)
          .add(const ToggleControllerRequested());
    }
  }
}
