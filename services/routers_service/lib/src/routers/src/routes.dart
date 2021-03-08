import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Routes
@immutable
abstract class GalleryRoutePath {
  const GalleryRoutePath();
}

class UnknownPagePath extends GalleryRoutePath {
  static const String kUnknownPageLocation = '404';

  const UnknownPagePath();
}

class LoginPagePath extends GalleryRoutePath {
  static const String kLoginPageLocation = 'login';

  const LoginPagePath();
}

class RootPagePath extends GalleryRoutePath {
  static const String kRootPageLocation = '';

  const RootPagePath();
}

class AlbumPagePath extends GalleryRoutePath {
  static const String kAlbumPageLocation = 'album';

  const AlbumPagePath(this.albumPath);

  final String albumPath;
}

class MediaFullscreenPath extends GalleryRoutePath {
  static const String kFullscreenPageLocation = 'view';

  const MediaFullscreenPath(this.albumPath, this.mediaPath);

  final String albumPath;
  final String mediaPath;
}
