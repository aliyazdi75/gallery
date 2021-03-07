import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:gallery_service/gallery_service.dart';

class FullscreenAsset {
  static Future<Media> getMedia(String path) async {
    Map<String, dynamic> response;

    final jsonStr = await rootBundle.loadString(path);
    response = jsonDecode(jsonStr) as Map<String, dynamic>;

    return Media.fromJson(response);
  }
}
