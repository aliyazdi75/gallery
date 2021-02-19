import 'dart:async';

import 'package:fullscreen_service/src/providers/api/index.dart';
import 'package:gallery_service/gallery_service.dart';

class FullscreenRepository {
  Future<Media> getMedia({required String path}) async {
    final mediaResponse = await FullscreenApi.getMedia(path);
    return mediaResponse;
  }
}
