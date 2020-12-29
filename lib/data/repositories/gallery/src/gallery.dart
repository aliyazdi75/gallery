import 'dart:async';

import 'package:ceit_alumni/data/models/gallery/index.dart';
import 'package:ceit_alumni/data/providers/api/gallery/index.dart';
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
