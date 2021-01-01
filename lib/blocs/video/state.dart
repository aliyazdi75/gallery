part of 'bloc.dart';

enum VideoStatus { initial, initialized, failure }

class VideoState extends Equatable {
  const VideoState({
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
  final VideoPlayerController videoPlayerController;
  final double aspectRatio;
  final bool isShowingController;
  final bool isCompleted;
  final bool isPlaying;
  final bool isBuffering;
  final Duration duration;
  final Duration position;
  final String durationText;
  final String positionText;
  final double volume;
  final List<DurationRange> buffered;

  static String _durationConvert(Duration duration) =>
      '${duration.inHours == 0 ? '' : duration.inHours.toString().padLeft(2, '0') + ':'}'
      '${duration.inMinutes.remainder(60).toString().padLeft(2, '0')}'
      ':${duration.inSeconds.remainder(60).toString().padLeft(2, '0')}';

  VideoState copyWith({
    VideoStatus status,
    VideoPlayerController videoPlayerController,
    bool isShowingController,
    bool isCompleted,
  }) {
    final controller = videoPlayerController?.value;
    final nullController = controller == null;
    return VideoState(
      status: status ?? this.status,
      videoPlayerController:
          videoPlayerController ?? this.videoPlayerController,
      aspectRatio: nullController ? aspectRatio : controller.aspectRatio,
      isShowingController: isShowingController ?? this.isShowingController,
      isCompleted: isCompleted ?? this.isCompleted,
      isPlaying: nullController ? isPlaying : controller.isPlaying,
      isBuffering: nullController ? isPlaying : controller.isBuffering,
      duration: nullController ? duration : controller.duration,
      position: nullController ? position : controller.position,
      durationText:
          nullController ? durationText : _durationConvert(controller.duration),
      positionText:
          nullController ? positionText : _durationConvert(controller.position),
      volume: nullController ? volume : controller.volume,
      buffered: nullController ? buffered : controller.buffered,
    );
  }

  @override
  List<Object> get props => [
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
