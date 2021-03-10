import 'dart:async';
import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:constants_service/constants_service.dart';
import 'package:convert/convert.dart';
import 'package:gallery_service/src/models/index.dart';
import 'package:gallery_service/src/providers/api/index.dart';
import 'package:github_service/github_service.dart';

class GalleryRepository {
  GalleryRepository({this.gallery});

  final Gallery? gallery;

  Future<Gallery> getGallery({required String path}) async {
    if (usingGithubAssetProvider) {
      final githubContents =
          await GithubApi.getGithubContents(_galleryDecodePath(path));
      return _getGithubGallery(githubContents, path);
    }

    final query = GalleryQuery((b) => b..path = path);
    return await GalleryApi.getGalleryList(query);
  }

  String _galleryDecodePath(String galleryEncodedPath) {
    final bytes = hex.decode(galleryEncodedPath);
    return utf8.decode(bytes);
  }

  String _galleryEncodePath(String galleryPath) {
    final bytes = utf8.encode(galleryPath);
    return hex.encode(bytes);
  }

  Gallery _getGithubGallery(
      List<GithubContent> githubContents, String currentGalleryDecodedPath) {
    //Making URI
    final currentGalleryEncodedPath =
        _galleryDecodePath(currentGalleryDecodedPath);
    final albumUri = Uri.parse(currentGalleryEncodedPath);

    //Making Parent
    String? _parentGalleryDecodedPath;
    if (albumUri.pathSegments.isNotEmpty) {
      final parentList = albumUri.pathSegments.toList()..removeLast();
      _parentGalleryDecodedPath = _galleryEncodePath(parentList.join());
    }

    //Making albums and medias
    final albums = <Album>[];
    final medias = <Media>[];
    githubContents.forEach((content) {
      if (content.type == GithubContentType.dir) {
        albums.add(
          Album(
            (b) => b
              ..name = content.name
              ..path = _galleryEncodePath(
                  '$currentGalleryEncodedPath/${content.name}'),
          ),
        );
      } else if (content.type == GithubContentType.file) {
        //Check file restriction
        final fileType = content.name.split('.').last;
        final isImage =
            supportedGithubImageFiles.contains(fileType.toLowerCase());
        final isVideo =
            supportedGithubVideoFiles.contains(fileType.toLowerCase());

        //If it is restricted continue
        if ((isImage || isVideo) && content.size < maxImageSize) {
          medias.add(
            Media(
              (b) => b
                ..name = content.name
                ..path = _galleryEncodePath(
                    '$currentGalleryEncodedPath/${content.name}')
                ..type = isImage ? MediaType.image : MediaType.video
                ..thumbnail = content.url
                ..url = content.url,
            ),
          );
        }
      }
    });

    //Return Gallery
    return Gallery(
      (b) => b
        ..path = currentGalleryEncodedPath
        ..current = currentGalleryDecodedPath
        ..parent = _parentGalleryDecodedPath
        ..albums = albums.toBuiltList().toBuilder()
        ..medias = medias.toBuiltList().toBuilder(),
    );
  }
}
