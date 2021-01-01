import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:video_player/video_player.dart';

part 'event.dart';
part 'state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  VideoBloc() : super(const VideoState());

  AnimationController animationController;
  VideoPlayerController videoPlayerController;

  @override
  Stream<VideoState> mapEventToState(VideoEvent event) async* {
    if (event is VideoInitialized) {
      yield* _mapVideoInitializedToState(event);
    } else if (event is VideoUpdated) {
      yield* _mapVideoUpdatedToState(event);
    } else if (event is ToggleControllerRequested) {
      yield* _mapToggleControllerRequestedToState(event);
    } else if (event is AutoOffControllerRequested) {
      yield* _mapAutoOffControllerRequestedToState();
    }
  }

  @override
  Future<void> close() async {
    await videoPlayerController.dispose();
    await super.close();
  }

  Stream<VideoState> _mapVideoInitializedToState(
      VideoInitialized event) async* {
    try {
      if (videoPlayerController != null &&
          videoPlayerController.value.isInitialized) {
        return;
      }
      await _initialVideo(event.videoUrl);
    } on Exception catch (_) {
      yield state.copyWith(status: VideoStatus.failure);
    }
  }

  Future<void> _initialVideo(String videoUrl) async {
    videoPlayerController = VideoPlayerController.network(
      videoUrl,
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );
    videoPlayerController.addListener(
      () => add(const VideoUpdated()),
    );
    // await videoPlayerController.setLooping(false);
    await videoPlayerController.initialize();
    if (videoPlayerController.value.isInitialized) {
      await videoPlayerController.play();
    }
  }

  Stream<VideoState> _mapVideoUpdatedToState(VideoUpdated event) async* {
    try {
      if (videoPlayerController.value.errorDescription != null &&
          state.status != VideoStatus.failure) {
        yield state.copyWith(status: VideoStatus.failure);
      } else if (videoPlayerController.value.duration ==
              videoPlayerController.value.position &&
          !videoPlayerController.value.isPlaying) {
        await state.videoPlayerController.pause();
        await state.videoPlayerController
            .seekTo(const Duration(milliseconds: 0));
        await animationController?.forward();
      } else {
        yield state.copyWith(
          status: VideoStatus.initialized,
          videoPlayerController: videoPlayerController,
        );
      }
    } on Exception catch (_) {
      yield state.copyWith(status: VideoStatus.failure);
    }
  }

  Stream<VideoState> _mapToggleControllerRequestedToState(
      ToggleControllerRequested event) async* {
    Timer timer;
    if (state.isShowingController) {
      timer?.cancel();
      yield state.copyWith(isShowingController: false);
    } else {
      timer?.cancel();
      yield state.copyWith(isShowingController: true);
      timer = Timer.periodic(const Duration(seconds: 3), (t) async {
        if (state.isPlaying) {
          timer?.cancel();
          add(const AutoOffControllerRequested());
        }
      });
    }
  }

  Stream<VideoState> _mapAutoOffControllerRequestedToState() async* {
    yield state.copyWith(isShowingController: false);
  }
}
