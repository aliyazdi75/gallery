part of 'bloc.dart';

enum VideoStatus { initial, initialized, failure }

class VideoState extends Equatable {
  VideoState({
    this.status = VideoStatus.initial,
    this.videoPlayerController,
    this.aspectRatio,
    this.isShowingController = false,
    this.isCompleted = false,
    this.isPlaying,
    this.isBuffering,
    this.duration,
    this.position,
    this.durationText,
    this.positionText,
    this.volume,
    this.buffered,
  });

  final VideoStatus status;
  final VideoPlayerController? videoPlayerController;
  final double? aspectRatio;
  final bool isShowingController;
  final bool isCompleted;
  final bool? isPlaying;
  final bool? isBuffering;
  final Duration? duration;
  final Duration? position;
  final String? durationText;
  final String? positionText;
  final double? volume;
  final List<DurationRange>? buffered;

  static String? _durationConvert(Duration? duration) => duration == null
      ? null
      : '${duration.inHours == 0 ? '' : duration.inHours.toString().padLeft(2, '0') + ':'}'
          '${duration.inMinutes.remainder(60).toString().padLeft(2, '0')}'
          ':${duration.inSeconds.remainder(60).toString().padLeft(2, '0')}';

  VideoState copyWith({
    VideoStatus? status,
    VideoPlayerController? videoPlayerController,
    bool? isShowingController,
    bool? isCompleted,
  }) {
    return VideoState(
      status: status ?? this.status,
      videoPlayerController:
          videoPlayerController ?? this.videoPlayerController,
      aspectRatio: videoPlayerController?.value.aspectRatio ?? aspectRatio,
      isShowingController: isShowingController ?? this.isShowingController,
      isCompleted: isCompleted ?? this.isCompleted,
      isPlaying: videoPlayerController?.value.isPlaying ?? isPlaying,
      isBuffering: videoPlayerController?.value.isBuffering ?? isPlaying,
      duration: videoPlayerController?.value.duration ?? duration,
      position: videoPlayerController?.value.position ?? position,
      durationText: _durationConvert(videoPlayerController?.value.duration) ??
          durationText,
      positionText: _durationConvert(videoPlayerController?.value.position) ??
          positionText,
      volume: videoPlayerController?.value.volume ?? volume,
      buffered: videoPlayerController?.value.buffered ?? buffered,
    );
  }

  @override
  List<Object?> get props => [
        status,
        videoPlayerController,
        aspectRatio,
        isShowingController,
        isCompleted,
        isPlaying,
        isBuffering,
        duration,
        position,
        volume,
      ];
}
