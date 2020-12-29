part of 'bloc.dart';

@immutable
abstract class GalleryEvent extends Equatable {
  const GalleryEvent();

  @override
  List<Object> get props => [];
}

class GalleryRequested extends GalleryEvent {
  const GalleryRequested(this.path);

  final String path;
}
