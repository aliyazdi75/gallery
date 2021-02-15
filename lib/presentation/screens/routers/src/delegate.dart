import 'package:flutter/material.dart';
import 'package:gallery/main.dart';
import 'package:gallery/presentation/screens/album/view/album.dart';
import 'package:gallery/presentation/screens/fullscreen/fullscreen.dart';
import 'package:gallery/presentation/screens/login/login.dart';

import 'routes.dart';
import 'shell.dart';
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

  @override
  void dispose() {
    super.dispose();
    routersState.removeListener(notifyListeners);
  }

  @override
  GalleryRoutePath get currentConfiguration {
    if (routersState.show404) {
      return UnknownPagePath();
    }
    if (routersState.galleryPath == RootPagePath.rootRoute) {
      return RootPagePath();
    }
    if (routersState.galleryPath == LoginPagePath.loginRoute) {
      return LoginPagePath();
    }
    if (routersState.fileName == null) {
      return AlbumPagePath(routersState.albumsPath.last);
    }
    return MediaFullscreenPath(
        routersState.albumsPath.last, routersState.fileName);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage<dynamic>(
            child: GalleryAppShell(routersState: routersState)),
      ],
      onPopPage: (route, dynamic result) {
        return route.didPop(result);
      },
    );
  }

  @override
  Future<void> setInitialRoutePath(GalleryRoutePath path) {
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
      routersState.galleryPath = AlbumPagePath.albumRoute;
      routersState.fileName = path.fileName;
      routersState.pushAlbumPath(path.albumPath);
    }
    return super.setInitialRoutePath(path);
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
      routersState.galleryPath = AlbumPagePath.albumRoute;
      routersState.fileName = path.fileName;
      routersState.pushAlbumPath(path.albumPath);
    }
  }
}

typedef HandleRouteChangedFunction = void Function(String routeName,
    {bool isFileView, bool isPop, bool isRoot});

class InnerRouterDelegate extends RouterDelegate<GalleryRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<GalleryRoutePath> {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  InnerRouterDelegate(this._routersState);

  GalleryRoutersState _routersState;

  GalleryRoutersState get routersState => _routersState;

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
          if (routersState.fileName != null)
            FadeAnimationPage(
              key: ValueKey(routersState.fileName),
              child: MediaFullscreen(
                albumPath: routersState.albumsPath.last,
                fileName: routersState.fileName,
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
        } else if (routersState.fileName != null) {
          routersState.fileName = null;
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
    bool isFileView = false,
    bool isPop = false,
    bool isRoot = false,
  }) {
    if (isPop) {
      routersState.galleryPath =
          isRoot ? AlbumPagePath.albumRoute : AlbumPagePath.albumRoute;
      routersState.replaceAlbumPath(routeName);
    } else {
      if (isFileView) {
        routersState.fileName = routeName;
      } else {
        routersState.galleryPath = AlbumPagePath.albumRoute;
        routersState.pushAlbumPath(routeName);
      }
    }
  }
}

class FadeAnimationPage extends Page<dynamic> {
  final Widget child;

  FadeAnimationPage({LocalKey key, this.child}) : super(key: key);

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
