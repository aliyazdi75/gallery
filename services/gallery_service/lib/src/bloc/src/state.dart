part of 'bloc.dart';

enum GalleryStatus {
  initial,
  loading,
  success,
  successPushed,
  successPopped,
  failure,
}

class GalleryState extends Equatable {
  const GalleryState({
    this.status = GalleryStatus.initial,
    this.gallery,
    this.pushedGallery,
    this.poppedGallery,
  });

  final GalleryStatus status;
  final Gallery? gallery;
  final Gallery? pushedGallery;
  final Gallery? poppedGallery;

  GalleryState copyWith({
    required GalleryStatus status,
    Gallery? gallery,
    Gallery? pushedGallery,
    Gallery? poppedGallery,
  }) {
    return GalleryState(
      status: status,
      gallery: gallery ?? this.gallery,
      pushedGallery: pushedGallery ?? this.pushedGallery,
      poppedGallery: poppedGallery ?? this.poppedGallery,
    );
  }

  @override
  List<Object?> get props => [status, gallery];
}
