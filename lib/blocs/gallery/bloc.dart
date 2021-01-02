import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:ceit_alumni/data/models/gallery/index.dart';
import 'package:ceit_alumni/data/repositories/gallery/index.dart';
import 'package:ceit_alumni/http/index.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'event.dart';
part 'state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  GalleryBloc({
    @required this.galleryRepository,
  })  : assert(galleryRepository != null),
        super(GalleryState.initial());

  final GalleryRepository galleryRepository;

  @override
  Stream<GalleryState> mapEventToState(GalleryEvent event) async* {
    if (event is GalleryPushRequested) {
      yield* _mapGalleryPushRequestedToState(event);
    } else if (event is GalleryPopRequested) {
      final galleriesViewed = state.galleriesViewed.toBuilder();
      galleriesViewed.removeLast();
      yield state.copyWith(galleriesViewed: galleriesViewed.build());
    }
  }

  Stream<GalleryState> _mapGalleryPushRequestedToState(
      GalleryPushRequested event) async* {
    yield state.copyWith(status: GalleryStatus.loading);
    try {
      final gallery = await galleryRepository.getGallery(path: event.path);
      final galleriesViewed = state.galleriesViewed.toBuilder();
      galleriesViewed.add(gallery);
      yield state.copyWith(
        status: GalleryStatus.success,
        galleriesViewed: galleriesViewed.build(),
      );
    } on BadRequestException catch (_) {
      //todo: create this bad request model
      yield state.copyWith(status: GalleryStatus.failure);
    } on SocketException catch (_) {
      print('kir to netet');
      yield state.copyWith(status: GalleryStatus.failure);
    } on Exception catch (_) {
      yield state.copyWith(status: GalleryStatus.failure);
    }
  }
}
