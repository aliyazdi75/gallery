import 'dart:convert';

import 'package:constants_service/constants_service.dart';
import 'package:flutter/services.dart';
import 'package:gallery_service/models/index.dart';
import 'package:http_service/http_service.dart';

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
