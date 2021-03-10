import 'dart:async';
import 'dart:convert';

import 'package:constants_service/constants_service.dart';
import 'package:convert/convert.dart';
import 'package:fullscreen_service/src/providers/api/index.dart';
import 'package:gallery_service/gallery_service.dart';
import 'package:github_service/github_service.dart';

class FullscreenRepository {
  Future<Media> getMedia(
      {required String albumPath, required String mediaPath}) async {
    if (usingGithubAssetProvider) {
      final githubContent =
          await GithubApi.getGithubContent(_galleryDecodePath(mediaPath));
      return _getGithubMedia(githubContent, albumPath, mediaPath);
    }
    return await FullscreenApi.getMedia(mediaPath);
  }

  String _galleryDecodePath(String galleryEncodedPath) {
    final bytes = hex.decode(galleryEncodedPath);
    return utf8.decode(bytes);
  }

  String _galleryEncodePath(String galleryPath) {
    final bytes = utf8.encode(galleryPath);
    return hex.encode(bytes);
  }

  Media _getGithubMedia(
    GithubContent githubContent,
    String galleryDecodedPath,
    String mediaDecodedPath,
  ) {
    final galleryEncodedPath = _galleryDecodePath(galleryDecodedPath);
    final mediaEncodedPath = _galleryDecodePath(mediaDecodedPath);

    final fileType = githubContent.name.split('.').last;
    final isImage = supportedGithubImageFiles.contains(fileType.toLowerCase());
    return Media(
      (b) => b
        ..name = githubContent.name
        ..path = _galleryEncodePath('$galleryEncodedPath/$mediaEncodedPath')
        ..type = isImage ? MediaType.image : MediaType.video
        ..thumbnail = githubContent.url
        ..url = githubContent.url,
    );
  }
}
