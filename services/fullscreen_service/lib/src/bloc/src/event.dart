part of 'bloc.dart';

@immutable
abstract class FullscreenEvent extends Equatable {
  const FullscreenEvent();

  @override
  List<Object> get props => [];
}

class FullscreenPushRequested extends FullscreenEvent {
  const FullscreenPushRequested(
      {required this.albumPath, required this.mediaPath});

  final String albumPath;
  final String mediaPath;

  @override
  List<Object> get props => [albumPath, mediaPath];
}
