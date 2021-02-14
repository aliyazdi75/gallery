import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'state.dart';

class NoAnimationMaterialPageRoute<T> extends MaterialPageRoute<T> {
  NoAnimationMaterialPageRoute({
    @required WidgetBuilder builder,
    RouteSettings settings,
  }) : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}

// Routes
abstract class GalleryRoutePath {}

class UnknownPagePath extends GalleryRoutePath {}

class RootPagePath extends GalleryRoutePath {
  final String rootPath;
  static const String rootRoute = '';

  RootPagePath({this.rootPath = rootRoute});
}

class LoginPagePath extends GalleryRoutePath {
  static const String loginRoute = 'login';
}

class AlbumPagePath extends GalleryRoutePath {
  final String albumPath;

  static const String albumRoute = 'album';

  AlbumPagePath(this.albumPath);
}

class MediaFullscreenPath extends GalleryRoutePath {
  final String albumPath;
  final String fileName;

  static const String fullscreenRoute = 'view';

  MediaFullscreenPath(this.albumPath, this.fileName);
}

class GalleryRouteInformationParser
    extends RouteInformationParser<GalleryRoutePath> {
  GalleryRouteInformationParser(this.routersState);

  final GalleryRoutersState routersState;

  @override
  Future<GalleryRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location);

    // '/'
    if (uri.pathSegments.isEmpty) {
      routersState.galleryPath = RootPagePath.rootRoute;
      return RootPagePath();
    }

    // '/${}/'
    switch (uri.pathSegments.first) {
      // '/login/'
      case LoginPagePath.loginRoute:
        routersState.galleryPath = LoginPagePath.loginRoute;
        return LoginPagePath();
      // '/'
      case AlbumPagePath.albumRoute:
        if (uri.pathSegments.length > 1) {
          // '/album/${}/view/${}/'
          if (uri.pathSegments.length > 3 &&
              uri.pathSegments[2] == MediaFullscreenPath.fullscreenRoute) {
            return MediaFullscreenPath(
              uri.pathSegments[1],
              uri.pathSegments[3],
            );
          }
          // '/album/${}/'
          routersState.galleryPath = AlbumPagePath.albumRoute;
          routersState.pushAlbumPath(uri.pathSegments[1]);
          return AlbumPagePath(uri.pathSegments[1]);
        }
    }

    // 404
    routersState.show404 = true;
    return UnknownPagePath();
  }

  //todo: handle route name like http://localhost:34835/gallery/album/gallery/
  //todo: handle route web chrome back
  @override
  RouteInformation restoreRouteInformation(GalleryRoutePath configuration) {
    if (configuration is UnknownPagePath) {
      return const RouteInformation(
        location: '/404',
      );
    }
    if (configuration is RootPagePath) {
      return const RouteInformation(
        location: '/',
      );
    }
    if (configuration is LoginPagePath) {
      return const RouteInformation(
        location: '/' + LoginPagePath.loginRoute,
      );
    }
    if (configuration is AlbumPagePath) {
      return RouteInformation(
        location:
            '/' + AlbumPagePath.albumRoute + '/' + configuration.albumPath,
      );
    }
    if (configuration is MediaFullscreenPath) {
      return RouteInformation(
        location: '/' +
            AlbumPagePath.albumRoute +
            '/' +
            configuration.albumPath +
            '/' +
            MediaFullscreenPath.fullscreenRoute +
            '/' +
            configuration.fileName,
      );
    }
    return null;
  }
}
