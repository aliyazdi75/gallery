import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

part 'event.dart';
part 'state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  VideoBloc() : super(VideoState());

  late AnimationController animationController;
  late VideoPlayerController _videoPlayerController;
  Timer? _timer;

  @override
  Stream<VideoState> mapEventToState(VideoEvent event) async* {
    if (event is VideoInitialized) {
      yield* _mapVideoInitializedToState(event);
    } else {
      assert(
        state.videoPlayerController != null,
        'You must first initial the bloc!',
      );
      if (event is VideoUpdated) {
        yield* _mapVideoUpdatedToState();
      } else if (event is ToggleControllerRequested) {
        yield* _mapToggleControllerRequestedToState();
      } else if (event is PersistShowingControllerRequested) {
        yield* _mapPersistShowingControllerRequestedToState();
      } else if (event is AutoOffControllerRequested) {
        yield* _mapAutoOffControllerRequestedToState();
      }
    }
  }

  @override
  Future<void> close() async {
    animationController.dispose();
    _timer?.cancel();
    await _videoPlayerController.dispose();
    await super.close();
  }

  Stream<VideoState> _mapVideoInitializedToState(
      VideoInitialized event) async* {
    try {
      await _initialVideo(event.videoUrl);
    } on Exception catch (_) {
      yield state.copyWith(status: VideoStatus.failure);
    }
  }

  Future<void> _initialVideo(String videoUrl) async {
    _videoPlayerController = VideoPlayerController.network(videoUrl);
    _videoPlayerController.addListener(
      () => add(const VideoUpdated()),
    );
    // await videoPlayerController.setLooping(false);
    await _videoPlayerController.initialize();
    if (_videoPlayerController.value.isInitialized) {
      await _videoPlayerController.play();
    }
  }

  Stream<VideoState> _mapVideoUpdatedToState() async* {
    try {
      if (_videoPlayerController.value.errorDescription != null &&
          state.status != VideoStatus.failure) {
        yield state.copyWith(status: VideoStatus.failure);
      } else if (_videoPlayerController.value.duration ==
              _videoPlayerController.value.position &&
          !_videoPlayerController.value.isPlaying) {
        await state.videoPlayerController!.pause();
        await state.videoPlayerController!
            .seekTo(const Duration(milliseconds: 0));
        await animationController.forward();
        add(const PersistShowingControllerRequested());
      } else {
        yield state.copyWith(
          status: VideoStatus.initialized,
          videoPlayerController: _videoPlayerController,
        );
      }
    } on Exception catch (_) {
      yield state.copyWith(status: VideoStatus.failure);
    }
  }

  Stream<VideoState> _mapToggleControllerRequestedToState() async* {
    if (state.isShowingController) {
      _timer?.cancel();
      yield state.copyWith(isShowingController: false);
    } else {
      yield state.copyWith(isShowingController: true);
      _timerShowingController();
    }
  }

  Stream<VideoState> _mapPersistShowingControllerRequestedToState() async* {
    if (!state.isShowingController) {
      yield state.copyWith(isShowingController: true);
      _timerShowingController();
    }
  }

  void _timerShowingController() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 3), (t) async {
      if (state.isPlaying!) {
        _timer?.cancel();
        add(const AutoOffControllerRequested());
      }
    });
  }

  Stream<VideoState> _mapAutoOffControllerRequestedToState() async* {
    yield state.copyWith(isShowingController: false);
  }
}
