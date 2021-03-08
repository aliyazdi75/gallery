import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:routers_service/src/models/index.dart';

import 'routes.dart';

class RouterConfiguration {
  RouterConfiguration(this.path, this.browserState);

  GalleryRoutePath? path;
  BrowserState? browserState;
}

class GalleryRouteInformationParser
    extends RouteInformationParser<RouterConfiguration> {
  @override
  Future<RouterConfiguration> parseRouteInformation(
      RouteInformation routeInformation) {
    final uri = Uri.parse(routeInformation.location!);
    final state = routeInformation.state;
    final browserState = BrowserState.fromJson(
        state == null ? <String, dynamic>{} : state as Map<String, dynamic>);

    // '/'
    if (uri.pathSegments.isEmpty) {
      final newState = browserState.galleriesHistory
              .contains(RootPagePath.kRootPageLocation)
          ? browserState
          : browserState.rebuild(
              (b) => b..galleriesHistory.add(RootPagePath.kRootPageLocation));
      return SynchronousFuture<RouterConfiguration>(
          RouterConfiguration(const RootPagePath(), newState));
    }

    // '/${}/'
    switch (uri.pathSegments.first) {
      // '/login/'
      case LoginPagePath.kLoginPageLocation:
        return SynchronousFuture<RouterConfiguration>(
            RouterConfiguration(const LoginPagePath(), browserState));

      // '/album/${}'
      case AlbumPagePath.kAlbumPageLocation:
        if (uri.pathSegments.length > 1) {
          final albumPath = uri.pathSegments[1];
          final filePath =
              uri.queryParameters[MediaFullscreenPath.kFullscreenPageLocation];
          final newState = browserState.galleriesHistory.contains(albumPath)
              ? browserState
              : browserState.rebuild((b) => b..galleriesHistory.add(albumPath));

          // '/album/${}?view=${}'
          if (filePath != null && filePath.isNotEmpty) {
            return SynchronousFuture<RouterConfiguration>(RouterConfiguration(
                MediaFullscreenPath(albumPath, filePath), newState));
          }

          // '/album/${}/'
          return SynchronousFuture<RouterConfiguration>(
              RouterConfiguration(AlbumPagePath(albumPath), newState));
        }
    }

    // 404
    return SynchronousFuture<RouterConfiguration>(
        RouterConfiguration(const UnknownPagePath(), browserState));
  }

  @override
  RouteInformation? restoreRouteInformation(RouterConfiguration configuration) {
    if (configuration.path is UnknownPagePath) {
      return RouteInformation(
        location: '/' + UnknownPagePath.kUnknownPageLocation,
        state: configuration.browserState!.toJson(),
      );
    }
    if (configuration.path is RootPagePath) {
      return RouteInformation(
        location: '/' + RootPagePath.kRootPageLocation,
        state: configuration.browserState!.toJson(),
      );
    }
    if (configuration.path is LoginPagePath) {
      return RouteInformation(
        location: '/' + LoginPagePath.kLoginPageLocation,
        state: configuration.browserState!.toJson(),
      );
    }
    if (configuration.path is AlbumPagePath) {
      final path = configuration.path as AlbumPagePath;
      return RouteInformation(
        location: '/' + AlbumPagePath.kAlbumPageLocation + '/' + path.albumPath,
        state: configuration.browserState!.toJson(),
      );
    }
    if (configuration.path is MediaFullscreenPath) {
      final path = configuration.path as MediaFullscreenPath;
      return RouteInformation(
        location: '/' +
            AlbumPagePath.kAlbumPageLocation +
            '/' +
            path.albumPath +
            '?' +
            MediaFullscreenPath.kFullscreenPageLocation +
            '=' +
            path.mediaPath,
        state: configuration.browserState!.toJson(),
      );
    }
    return null;
  }
}
