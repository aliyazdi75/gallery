part of 'bloc.dart';

@immutable
abstract class FullscreenEvent extends Equatable {
  const FullscreenEvent();

  @override
  List<Object?> get props => [];
}

class FullscreenPushRequested extends FullscreenEvent {
  const FullscreenPushRequested({this.path});

  final String? path;

  @override
  List<Object?> get props => [path];
}
