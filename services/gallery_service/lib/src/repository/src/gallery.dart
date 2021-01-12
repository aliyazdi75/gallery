import 'dart:async';

import 'package:gallery_service/src/models/index.dart';
import 'package:gallery_service/src/providers/api/index.dart';
import 'package:meta/meta.dart';

class GalleryRepository {
  Future<Gallery> getGallery({
    @required String path,
  }) async {
    assert(path != null);

    final query = GalleryQuery(
      (b) => b..path = path,
    );

    final galleryResponse = await GalleryApi.getGalleryList(query);
    return galleryResponse;
  }
}
