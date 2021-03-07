import 'package:gallery_service/src/models/index.dart';
import 'package:http_service/http_service.dart';

class GalleryApi {
  static Future<Gallery> getGalleryList(GalleryQuery query) async {
    Map<String, dynamic> response;

    final queryParams = Map<String, String>.from(query.toJson());
    response = await HttpHelper('list').httpGet(queryParams: queryParams);
    return Gallery.fromJson(response);
  }
}
