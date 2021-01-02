part of 'bloc.dart';

@immutable
abstract class GalleryEvent extends Equatable {
  const GalleryEvent();

  @override
  List<Object> get props => [];
}

class GalleryPushRequested extends GalleryEvent {
  const GalleryPushRequested(this.path);

  final String path;

  @override
  List<Object> get props => [path];
}

class GalleryPopRequested extends GalleryEvent {
  const GalleryPopRequested();
}
