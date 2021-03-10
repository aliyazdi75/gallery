import 'package:constants_service/constants_service.dart';
import 'package:github_service/src/models/index.dart';
import 'package:http_service/http_service.dart';

class GithubApi {
  static Future<List<GithubContent>> getGithubContents(String path) async {
    //Get lost of contents
    final response =
        await GithubHttpHelper('contents/assets/gallery$path').httpGet();

    //This must not be list otherwise throw
    try {
      return GithubContents.fromJson(response);
    } on TypeError {
      throw NotFoundException(path);
    }
  }

  static Future<GithubContent> getGithubContent(String path) async {
    //Get the content
    final response =
        await GithubHttpHelper('contents/assets/gallery$path').httpGet();
    late final GithubContent githubContent;

    //This must be list otherwise throw
    try {
      githubContent = GithubContent.fromJson(response);
    } on TypeError {
      throw NotFoundException(path);
    }

    //Check file restriction
    final fileType = githubContent.name.split('.').last;
    final isImage = supportedGithubImageFiles.contains(fileType.toLowerCase());
    final isVideo = supportedGithubVideoFiles.contains(fileType.toLowerCase());
    if (!(isImage || isVideo) || githubContent.size > maxImageSize) {
      throw NotFoundException(path);
    }

    return githubContent;
  }
}
