import 'dart:async';

import 'package:constants_service/constants_service.dart';
import 'package:fullscreen_service/src/providers/api/index.dart';
import 'package:fullscreen_service/src/providers/asset/index.dart';
import 'package:gallery_service/gallery_service.dart';
import 'package:http_service/http_service.dart';

class FullscreenRepository {
  Future<Media> getMedia({required String path}) async {
    final mediaResponse = usingAssetResponse
        ? await FullscreenAsset.getMedia(_assetsResponsePath(path))
        : await FullscreenApi.getMedia(path);
    return mediaResponse;
  }

  String _assetsResponsePath(String path) {
    switch (path) {
      case 'photo1':
        return assetResponsePhoto1;
      case 'photo2':
        return assetResponsePhoto2;
      case 'photo3':
        return assetResponsePhoto3;
      case 'photo4':
        return assetResponsePhoto4;
      case 'photo5':
        return assetResponsePhoto5;
      case 'photo6':
        return assetResponsePhoto6;
      case 'photo7':
        return assetResponsePhoto7;
      case 'photo8':
        return assetResponsePhoto8;
      case 'photo9':
        return assetResponsePhoto9;
      case 'photo10':
        return assetResponsePhoto10;
      default:
        throw NotFoundException(path);
    }
  }
}
