part of 'bloc.dart';

enum GalleryStatus { initial, loading, success, failure }

class GalleryState extends Equatable {
  const GalleryState({
    this.status,
    this.galleriesViewed,
  });

  final GalleryStatus status;
  final BuiltList<Gallery> galleriesViewed;

  GalleryState.initial()
      : this(
          status: GalleryStatus.initial,
          galleriesViewed: BuiltList.of([]),
        );

  GalleryState copyWith({
    GalleryStatus status,
    BuiltList<Gallery> galleriesViewed,
  }) {
    return GalleryState(
      status: status ?? this.status,
      galleriesViewed: galleriesViewed ?? this.galleriesViewed,
    );
  }

  @override
  List<Object> get props => [status, galleriesViewed];
}
