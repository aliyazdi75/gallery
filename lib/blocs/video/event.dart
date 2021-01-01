part of 'bloc.dart';

@immutable
abstract class VideoEvent extends Equatable {
  const VideoEvent();

  @override
  List<Object> get props => [];
}

class VideoInitialized extends VideoEvent {
  const VideoInitialized(this.videoUrl);

  final String videoUrl;

  @override
  List<Object> get props => [videoUrl];
}

class VideoUpdated extends VideoEvent {
  const VideoUpdated();

  @override
  List<Object> get props => [];
}

class ToggleControllerRequested extends VideoEvent {
  const ToggleControllerRequested();

  @override
  List<Object> get props => [];
}

class AutoOffControllerRequested extends VideoEvent {
  const AutoOffControllerRequested();

  @override
  List<Object> get props => [];
}
