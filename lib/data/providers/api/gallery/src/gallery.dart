import 'dart:convert';

import 'package:ceit_alumni/data/constants/index.dart';
import 'package:ceit_alumni/data/models/gallery/index.dart';
import 'package:ceit_alumni/http/index.dart';
import 'package:flutter/services.dart';

class GalleryApi {
  static Future<Gallery> getGalleryList(GalleryQuery query) async {
    Map<String, dynamic> response;
    if (usingAssetResponse) {
      final jsonStr = await rootBundle.loadString(assetResponseAddress);
      response = jsonDecode(jsonStr) as Map<String, dynamic>;
    } else {
      final queryParams = Map<String, String>.from(query.toJson());
      response = await HttpHelper('list').httpGet(queryParams: queryParams);
    }
    return Gallery.fromJson(response);
  }
}
