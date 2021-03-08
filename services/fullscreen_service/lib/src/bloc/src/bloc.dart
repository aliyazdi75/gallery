import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fullscreen_service/src/repository/index.dart';
import 'package:gallery_service/gallery_service.dart';
import 'package:http_service/http_service.dart';

part 'event.dart';
part 'state.dart';

class FullscreenBloc extends Bloc<FullscreenEvent, FullscreenState> {
  FullscreenBloc({required this.fullscreenRepository})
      : super(const FullscreenState());

  final FullscreenRepository fullscreenRepository;

  @override
  Stream<FullscreenState> mapEventToState(FullscreenEvent event) async* {
    if (event is FullscreenPushRequested) {
      yield* _mapGalleryPushRequestedToState(event);
    }
  }

  Stream<FullscreenState> _mapGalleryPushRequestedToState(
      FullscreenPushRequested event) async* {
    yield state.copyWith(status: FullscreenStatus.loading);

    try {
      final media = await fullscreenRepository.getMedia(path: event.path);
      yield state.copyWith(status: FullscreenStatus.success, media: media);
    } on NotFoundException {
      print('kir to oon urlet');
      yield state.copyWith(status: FullscreenStatus.notFound);
    } on SocketException {
      print('kir to netet');
      yield state.copyWith(status: FullscreenStatus.failure);
    } on Exception {
      yield state.copyWith(status: FullscreenStatus.failure);
    }
  }
}
