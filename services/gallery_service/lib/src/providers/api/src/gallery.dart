import 'package:gallery_service/src/models/index.dart';
import 'package:http_service/http_service.dart';

class GalleryApi {
  static Future<Gallery> getGalleryList(GalleryQuery query) async {
    final response =
        await HttpHelper('list').httpGet(queryParams: query.toJson());
    return Gallery.fromJson(response);
  }
}
