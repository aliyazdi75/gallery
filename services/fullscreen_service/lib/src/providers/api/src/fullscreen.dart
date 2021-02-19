import 'package:gallery_service/gallery_service.dart';
import 'package:http_service/http_service.dart';

class FullscreenApi {
  static Future<Media> getMedia(String path) async {
    final response = await HttpHelper('file/$path').httpGet();
    return Media.fromJson(response);
  }
}
