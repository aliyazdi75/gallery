import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:gallery_service/src/models/index.dart';

class GalleryAsset {
  static Future<Gallery> getGalleryList(String path) async {
    Map<String, dynamic> response;

    final jsonStr = await rootBundle.loadString(path);
    response = jsonDecode(jsonStr) as Map<String, dynamic>;

    return Gallery.fromJson(response);
  }
}
