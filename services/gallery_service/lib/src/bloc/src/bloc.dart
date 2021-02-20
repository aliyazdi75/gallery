import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gallery_service/src/models/src/gallery.dart';
import 'package:gallery_service/src/repository/index.dart';
import 'package:gallery_service/src/repository/src/gallery.dart';
import 'package:http_service/http_service.dart';

part 'event.dart';
part 'state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  GalleryBloc({required this.galleryRepository}) : super(const GalleryState());

  final GalleryRepository galleryRepository;

  @override
  Stream<GalleryState> mapEventToState(GalleryEvent event) async* {
    if (event is GalleryPushRequested) {
      yield* _mapGalleryPushRequestedToState(event);
    } else if (event is GalleryPopRequested) {
      assert(state.galleries.isNotEmpty);
      yield* _mapGalleryPpoRequestedToState();
    }
  }

  Stream<GalleryState> _mapGalleryPushRequestedToState(
      GalleryPushRequested event) async* {
    yield state.copyWith(status: GalleryStatus.loading);
    try {
      final gallery = await galleryRepository.getGallery(path: event.path);
      yield state.copyWith(
        status: GalleryStatus.successPush,
        galleries: List.of(state.galleries)..add(gallery),
      );
      //todo: add 404 checking to trigger 404
    } on SocketException {
      print('kir to netet');
      yield state.copyWith(status: GalleryStatus.failure);
    } on Exception {
      yield state.copyWith(status: GalleryStatus.failure);
    }
  }

  Stream<GalleryState> _mapGalleryPpoRequestedToState() async* {
    assert(state.galleries.isNotEmpty);
    if (state.galleries.length > 1) {
      yield state.copyWith(galleries: List.of(state.galleries)..removeLast());
    } else {
      yield state.copyWith(status: GalleryStatus.loading);
      try {
        final gallery = await galleryRepository.getGallery(
            path: state.galleries.last.parent ?? '');
        yield state.copyWith(
          status: GalleryStatus.successPop,
          galleries: [gallery],
        );
      } on SocketException {
        print('kir to netet');
        yield state.copyWith(status: GalleryStatus.failure);
      } on Exception {
        yield state.copyWith(status: GalleryStatus.failure);
      }
    }
  }
}
