import 'dart:async';

import 'package:constants_service/constants_service.dart';
import 'package:gallery_service/src/models/index.dart';
import 'package:gallery_service/src/providers/api/index.dart';
import 'package:gallery_service/src/providers/asset/index.dart';
import 'package:http_service/http_service.dart';

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
        return assetResponseAlbum1;
      case 'album1':
        return assetResponseAlbum1;
      case 'album2':
        return assetResponseAlbum2;
      case 'album3':
        return assetResponseAlbum3;
      case 'album4':
        return assetResponseAlbum4;
      case 'album5':
        return assetResponseAlbum5;
      default:
        throw NotFoundException(path);
    }
  }
}
