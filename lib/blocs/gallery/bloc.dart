import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ceit_alumni/data/models/gallery/index.dart';
import 'package:ceit_alumni/data/repositories/gallery/index.dart';
import 'package:ceit_alumni/http/index.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'event.dart';
part 'state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  GalleryBloc({
    @required this.galleryRepository,
  })  : assert(galleryRepository != null),
        super(const GalleryState.initial());

  final GalleryRepository galleryRepository;

  @override
  Stream<GalleryState> mapEventToState(GalleryEvent event) async* {
    if (event is GalleryRequested) {
      yield* _mapGetGalleryRequestedToState(event);
    }
  }

  Stream<GalleryState> _mapGetGalleryRequestedToState(
      GalleryRequested event) async* {
    yield const GalleryState.loading();
    try {
      final gallery = await galleryRepository.getGallery(path: event.path);
      yield GalleryState.success(gallery);
    } on BadRequestException catch (_) {
      //todo: create this bad request model
      yield const GalleryState.failure();
    } on SocketException catch (_) {
      print('kir to netet');
      yield const GalleryState.failure();
    } on Exception catch (_) {
      yield const GalleryState.failure();
    }
  }
}
