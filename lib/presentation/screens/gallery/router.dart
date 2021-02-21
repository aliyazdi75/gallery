import 'package:flutter/widgets.dart';
import 'package:gallery/main.dart';
import 'package:gallery/presentation/animations/page.dart';
import 'package:gallery/presentation/screens/album/view/album.dart';
import 'package:gallery/presentation/screens/fullscreen/fullscreen.dart';
import 'package:routers_service/routers_service.dart';

class InnerGalleryRouterDelegate extends RouterDelegate<RouterConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RouterConfiguration> {
  InnerGalleryRouterDelegate(this._routerState);

  GalleryRoutersState _routerState;

  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  final heroController = HeroController();

  set routersState(GalleryRoutersState value) {
    if (value != _routerState) {
      _routerState = value;
      notifyListeners();
    }
  }

  //todo: the problem is that the build method called before app states
  @override
  Widget build(BuildContext context) {
    // debugPrint('browserState:' + _routerState.browserState.toString());
    // debugPrint('routePath:' + _routerState.routePath.toString());
    assert(
        _routerState.browserState != null, 'browserState must be initialized');
    return GalleryRouterStateScope(
      routerState: _routerState,
      child: Navigator(
        key: navigatorKey,
        observers: [heroController],
        pages: [
          if (_routerState.routePath is RootPagePath ||
              _routerState.browserState!.galleriesHistory
                  .contains(RootPagePath.kRootPageLocation))
            FadeAnimationPage(
              key: const ValueKey(RootPagePath),
              child: RootPage(
                albumPath: RootPagePath.kRootPageLocation,
                gallery: _routerState.browserState!.gallery,
              ),
            ),
          if (_routerState.routePath is AlbumPagePath ||
              _routerState.routePath is MediaFullscreenPath) ...[
            for (String galleryPath in _routerState
                .browserState!.galleriesHistory
                .where((gallery) => gallery != RootPagePath.kRootPageLocation))
              FadeAnimationPage(
                key: ValueKey(galleryPath),
                child: AlbumPage(
                  albumPath: galleryPath,
                  gallery: _routerState.browserState!.gallery,
                ),
              ),
            if (_routerState.routePath is MediaFullscreenPath)
              FadeAnimationPage(
                key: const ValueKey(MediaFullscreenPath),
                child: MediaFullscreen(
                  albumPath:
                      (_routerState.routePath as MediaFullscreenPath).albumPath,
                  mediaPath:
                      (_routerState.routePath as MediaFullscreenPath).mediaPath,
                  media: _routerState.browserState!.media,
                ),
              ),
          ]
        ],
        onPopPage: (route, dynamic result) {
          final success = route.didPop(result);
          if (success) {
            if (_routerState.routePath is MediaFullscreenPath) {
              final lastGalleryPath =
                  _routerState.browserState!.galleriesHistory.last;
              final newState =
                  _routerState.browserState!.rebuild((b) => b..media = null);
              final newPath = lastGalleryPath == RootPagePath.kRootPageLocation
                  ? const RootPagePath()
                  : AlbumPagePath(lastGalleryPath);
              GalleryRouterStateScope.of(context)!
                ..routePath = newPath
                ..browserState = newState;
            }
          }
          return success;
        },
      ),
    );
  }

  @override
  Future<void> setNewRoutePath(RouterConfiguration configuration) async {
    // This is not required for inner router delegate because it does not
    // parse route
    assert(false);
  }
}
