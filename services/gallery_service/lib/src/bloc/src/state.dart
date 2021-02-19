part of 'bloc.dart';

enum GalleryStatus { initial, loading, successPush, successPop, failure }

class GalleryState extends Equatable {
  const GalleryState({
    this.status = GalleryStatus.initial,
    this.galleries = const <Gallery>[],
  });

  final GalleryStatus status;
  final List<Gallery> galleries;

  GalleryState copyWith({
    GalleryStatus? status,
    List<Gallery>? galleries,
  }) {
    return GalleryState(
      status: status ?? this.status,
      galleries: galleries ?? this.galleries,
    );
  }

  @override
  List<Object?> get props => [status, galleries];
}
