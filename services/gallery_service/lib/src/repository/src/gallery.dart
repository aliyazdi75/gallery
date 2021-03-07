import 'dart:async';

import 'package:constants_service/constants_service.dart';
import 'package:gallery_service/src/models/index.dart';
import 'package:gallery_service/src/providers/api/index.dart';
import 'package:gallery_service/src/providers/asset/index.dart';

class GalleryRepository {
  GalleryRepository({this.gallery});

  final Gallery? gallery;

  Future<Gallery> getGallery({required String path}) async {
    final query = GalleryQuery(
      (b) => b..path = path,
    );

    final galleryResponse = usingAssetResponse
        ? await GalleryAsset.getGalleryList(_assetsResponsePath(path))
        : await GalleryApi.getGalleryList(query);
    return galleryResponse;
  }

  String _assetsResponsePath(String path) {
    switch (path) {
      case '':
        return assetResponsePath1;
      case 'p2':
        return assetResponsePath2;
      case 'p3':
        return assetResponsePath3;
      case 'p4':
        return assetResponsePath4;
      case 'p5':
        return assetResponsePath5;
      default:
        throw ('No more files!');
    }
  }
}
