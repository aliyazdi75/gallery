part of 'bloc.dart';

enum FullscreenStatus { initial, loading, success, notFound, failure }

class FullscreenState extends Equatable {
  const FullscreenState({
    this.status = FullscreenStatus.initial,
    this.media,
  });

  final FullscreenStatus status;
  final Media? media;

  FullscreenState copyWith({
    FullscreenStatus? status,
    Media? media,
  }) {
    return FullscreenState(
      status: status ?? this.status,
      media: media ?? this.media,
    );
  }

  @override
  List<Object?> get props => [status, media];
}
