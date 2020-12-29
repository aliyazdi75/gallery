import 'dart:convert';

import 'package:ceit_alumni/data/models/gallery/index.dart';
import 'package:flutter/services.dart' show rootBundle;

class GalleryApi {
  static Future<Gallery> getGalleryList(GalleryQuery query) async {
    // final queryParams = Map<String, String>.from(query.toJson());
    // final response = await HttpHelper('list').httpGet(
    //   queryParams: queryParams,
    //   headerType: HttpHeaderType.authenticated,
    // );
    final jsonStr = await rootBundle.loadString('assets/response.json');
    final response = jsonDecode(jsonStr) as Map<String, dynamic>;

    return Gallery.fromJson(response);
  }
}
