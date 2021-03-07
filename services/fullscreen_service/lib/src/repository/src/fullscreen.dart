import 'dart:async';

import 'package:constants_service/constants_service.dart';
import 'package:fullscreen_service/src/providers/api/index.dart';
import 'package:fullscreen_service/src/providers/asset/index.dart';
import 'package:gallery_service/gallery_service.dart';

class FullscreenRepository {
  Future<Media> getMedia({required String path}) async {
    final mediaResponse = usingAssetResponse
        ? await FullscreenAsset.getMedia(_assetsResponsePath(path))
        : await FullscreenApi.getMedia(path);
    return mediaResponse;
  }

  String _assetsResponsePath(String path) {
    switch (path) {
      case 'f1':
        return assetResponseFile1;
      case 'f2':
        return assetResponseFile2;
      case 'f3':
        return assetResponseFile3;
      case 'f4':
        return assetResponseFile4;
      case 'f5':
        return assetResponseFile5;
      case 'f6':
        return assetResponseFile6;
      case 'f7':
        return assetResponseFile7;
      case 'f8':
        return assetResponseFile8;
      case 'f9':
        return assetResponseFile9;
      case 'f10':
        return assetResponseFile10;
      default:
        throw ('No more files!');
    }
  }
}
