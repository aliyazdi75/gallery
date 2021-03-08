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
    if (event is GetGalleryRequested) {
      yield* _mapGetGalleryRequestedToState(event);
    } else if (event is GalleryPushRequested) {
      yield* _mapGalleryPushRequestedToState(event);
    } else if (event is GalleryPopRequested) {
      yield* _mapGalleryPopRequestedToState();
    }
  }

  Stream<GalleryState> _mapGetGalleryRequestedToState(
      GetGalleryRequested event) async* {
    if (galleryRepository.gallery != null) {
      yield state.copyWith(
        status: GalleryStatus.success,
        gallery: galleryRepository.gallery!,
      );
      return;
    }

    yield state.copyWith(status: GalleryStatus.loading);
    try {
      final gallery = await galleryRepository.getGallery(path: event.path);
      yield state.copyWith(
        status: GalleryStatus.success,
        gallery: gallery,
      );
      //todo: add 404 checking to trigger 404
    } on NotFoundException {
      print('kir to oon urlet');
      yield state.copyWith(status: GalleryStatus.notFound);
    } on SocketException {
      print('kir to netet');
      yield state.copyWith(status: GalleryStatus.failure);
    } on Exception {
      yield state.copyWith(status: GalleryStatus.failure);
    }
  }

  Stream<GalleryState> _mapGalleryPushRequestedToState(
      GalleryPushRequested event) async* {
    yield state.copyWith(status: GalleryStatus.loading);
    try {
      final gallery = await galleryRepository.getGallery(path: event.path);
      yield state.copyWith(
        status: GalleryStatus.successPushed,
        pushedGallery: gallery,
      );
      //todo: add 404 checking to trigger 404
    } on NotFoundException {
      print('kir to oon urlet');
      yield state.copyWith(status: GalleryStatus.notFound);
    } on SocketException {
      print('kir to netet');
      yield state.copyWith(status: GalleryStatus.failure);
    } on Exception {
      yield state.copyWith(status: GalleryStatus.failure);
    }
  }

  Stream<GalleryState> _mapGalleryPopRequestedToState() async* {
    yield state.copyWith(status: GalleryStatus.loading);
    try {
      final gallery =
          await galleryRepository.getGallery(path: state.gallery!.parent ?? '');
      yield state.copyWith(
        status: GalleryStatus.successPopped,
        poppedGallery: gallery,
      );
    } on NotFoundException {
      print('kir to oon urlet');
      yield state.copyWith(status: GalleryStatus.notFound);
    } on SocketException {
      print('kir to netet');
      yield state.copyWith(status: GalleryStatus.failure);
    } on Exception {
      yield state.copyWith(status: GalleryStatus.failure);
    }
  }
}
