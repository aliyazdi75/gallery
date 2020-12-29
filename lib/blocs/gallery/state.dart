part of 'bloc.dart';

enum GalleryStatus { initial, loading, success, failure }

class GalleryState extends Equatable {
  const GalleryState._({
    this.status,
    this.gallery,
  });

  final GalleryStatus status;
  final Gallery gallery;

  const GalleryState.initial() : this._(status: GalleryStatus.initial);

  const GalleryState.loading() : this._(status: GalleryStatus.loading);

  const GalleryState.success(Gallery gallery)
      : this._(
          status: GalleryStatus.success,
          gallery: gallery,
        );

  const GalleryState.failure() : this._(status: GalleryStatus.failure);

  @override
  List<Object> get props => [status, gallery];
}
