import 'package:flutter/material.dart';
import 'package:gallery/main.dart';
import 'package:gallery/presentation/screens/album/view/album.dart';
import 'package:gallery/presentation/screens/fullscreen/fullscreen.dart';
import 'package:gallery/presentation/screens/gallery/gallery.dart';
import 'package:gallery/presentation/screens/login/login.dart';
import 'package:gallery_service/gallery_service.dart';

import 'routes.dart';
import 'state.dart';

class GalleryRouterDelegate extends RouterDelegate<GalleryRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<GalleryRoutePath> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  GalleryRouterDelegate(this.routersState)
      : navigatorKey = GlobalKey<NavigatorState>() {
    routersState.addListener(notifyListeners);
  }

  final GalleryRoutersState routersState;
  final heroController = HeroController();

  @override
  void dispose() {
    super.dispose();
    routersState.removeListener(notifyListeners);
  }

  @override
  GalleryRoutePath? get currentConfiguration {
    if (routersState.show404) {
      return UnknownPagePath();
    }
    if (routersState.galleryPath == RootPagePath.rootRoute) {
      return RootPagePath();
    }
    if (routersState.galleryPath == LoginPagePath.loginRoute) {
      return LoginPagePath();
    }
    if (routersState.galleryPath == AlbumPagePath.albumRoute) {
      if (routersState.fullscreenRouteState != null) {
        return MediaFullscreenPath(
          routersState.albumsPath.last,
          routersState.fullscreenRouteState!.path,
        );
      } else if (routersState.albumsPath.isNotEmpty) {
        return AlbumPagePath(routersState.albumsPath.last);
      }
    }
    return RootPagePath();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage<dynamic>(child: GalleryShell(routersState: routersState)),
      ],
      onPopPage: (route, dynamic result) {
        return route.didPop(result);
      },
    );
  }

  //todo: add state to check weather the user is authenticated and if not route to login page
  //todo: add 404 exception to redirect to UnknownPagePath
  @override
  Future<void> setNewRoutePath(GalleryRoutePath path) async {
    if (path is UnknownPagePath) {
      routersState.show404 = true;
    } else if (path is RootPagePath) {
      routersState.galleryPath = RootPagePath.rootRoute;
    } else if (path is LoginPagePath) {
      //todo: handle login routing
      routersState.galleryPath = LoginPagePath.loginRoute;
    } else if (path is AlbumPagePath) {
      routersState.galleryPath = AlbumPagePath.albumRoute;
      routersState.pushAlbumPath(path.albumPath);
    } else if (path is MediaFullscreenPath) {
      routersState.fullscreenRouteState = FullscreenRouteState(path.mediaPath);
      routersState.pushAlbumPath(path.albumPath);
    }
  }
}

typedef HandleRouteChangedFunction = void Function(String routeName,
    {bool isPop, bool isRoot, Media? media});

class InnerRouterDelegate extends RouterDelegate<GalleryRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<GalleryRoutePath> {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  InnerRouterDelegate(this._routersState);

  GalleryRoutersState _routersState;

  GalleryRoutersState get routersState => _routersState;
  final heroController = HeroController();

  set routersState(GalleryRoutersState value) {
    if (value == _routersState) {
      return;
    }
    _routersState = value;
    notifyListeners();
  }

  //todo: the problem is that the build method called before app states
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      observers: [heroController],
      pages: [
        if (routersState.show404)
          //todo: create 404 page
          FadeAnimationPage(
            key: const ValueKey('404'),
            child: const LoginPage(),
          )
        else if (routersState.galleryPath == RootPagePath.rootRoute)
          FadeAnimationPage(
            key: const ValueKey(RootPagePath.rootRoute),
            child: RootPage(
              albumPath: RootPagePath.rootRoute,
              onRouteChanged: _handleRouteChanged,
            ),
          )
        else if (routersState.galleryPath == LoginPagePath.loginRoute)
          FadeAnimationPage(
            key: const ValueKey(LoginPagePath.loginRoute),
            child: const LoginPage(),
          )
        else ...[
          for (String page in routersState.albumsPath)
            FadeAnimationPage(
              key: ValueKey(page),
              child: AlbumPage(
                albumPath: page,
                onRouteChanged: _handleRouteChanged,
              ),
            ),
          if (routersState.fullscreenRouteState != null)
            FadeAnimationPage(
              key: ValueKey(routersState.fullscreenRouteState!.path),
              child: MediaFullscreen(
                albumPath: routersState.albumsPath.last,
                mediaPath: routersState.fullscreenRouteState!.path,
                media: routersState.fullscreenRouteState!.media,
                onRouteChanged: _handleRouteChanged,
              ),
            ),
        ]
      ],
      onPopPage: (route, dynamic result) {
        if (!route.didPop(result)) {
          return false;
        }

        if (routersState.show404) {
          routersState.show404 = false;
        } else if (routersState.fullscreenRouteState != null) {
          routersState.fullscreenRouteState = null;
        } else if (routersState.albumsPath.isNotEmpty) {
          routersState.popAlbumPath();
        }

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(GalleryRoutePath path) async {
    // This is not required for inner router delegate because it does not
    // parse route
    assert(false);
  }

  void _handleRouteChanged(
    String routeName, {
    bool isPop = false,
    bool isRoot = false,
    Media? media,
  }) {
    if (isPop) {
      routersState.galleryPath =
          isRoot ? RootPagePath.rootRoute : AlbumPagePath.albumRoute;
      routersState.replaceAlbumPath(routeName);
    } else {
      if (media == null) {
        routersState.galleryPath = AlbumPagePath.albumRoute;
        routersState.pushAlbumPath(routeName);
      } else {
        routersState.fullscreenRouteState =
            FullscreenRouteState(media.path, media: media);
      }
    }
  }
}

class FadeAnimationPage extends Page<dynamic> {
  final Widget child;

  FadeAnimationPage({LocalKey? key, required this.child}) : super(key: key);

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder<dynamic>(
      settings: this,
      pageBuilder: (context, animation, animation2) {
        var curveTween = CurveTween(curve: Curves.easeIn);
        return FadeTransition(
          opacity: animation.drive(curveTween),
          child: child,
        );
      },
    );
  }
}
