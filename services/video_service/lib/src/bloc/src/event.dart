part of 'bloc.dart';

@immutable
abstract class VideoEvent extends Equatable {
  const VideoEvent();

  @override
  List<Object?> get props => [];
}

class VideoInitialized extends VideoEvent {
  const VideoInitialized(this.videoUrl);

  final String videoUrl;

  @override
  List<Object?> get props => [videoUrl];
}

class VideoUpdated extends VideoEvent {
  const VideoUpdated();
}

class ToggleControllerRequested extends VideoEvent {
  const ToggleControllerRequested();
}

class PersistShowingControllerRequested extends VideoEvent {
  const PersistShowingControllerRequested();
}

class AutoOffControllerRequested extends VideoEvent {
  const AutoOffControllerRequested();
}
