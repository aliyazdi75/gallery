import 'package:ceit_alumni/data/models/gallery/index.dart';
import 'package:ceit_alumni/http/index.dart';

class GalleryApi {
  static Future<Gallery> getGalleryList(GalleryQuery query) async {
    final queryParams = Map<String, String>.from(query.toJson());
    final response = await HttpHelper('list').httpGet(queryParams: queryParams);
    // final jsonStr = await rootBundle.loadString('assets/response.json');
    // final response = jsonDecode(jsonStr) as Map<String, dynamic>;

    return Gallery.fromJson(response);
  }
}
