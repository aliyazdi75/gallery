import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gallery/presentation/animations/page.dart';
import 'package:gallery/presentation/screens/gallery/gallery.dart';
import 'package:gallery/presentation/screens/login/login.dart';
import 'package:routers_service/routers_service.dart';

class GalleryRouterDelegate extends RouterDelegate<RouterConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RouterConfiguration> {
  GalleryRouterDelegate(this.routerState)
      : navigatorKey = GlobalObjectKey<NavigatorState>(routerState) {
    routerState.addListener(notifyListeners);
  }

  final GalleryRoutersState routerState;

  @override
  final GlobalObjectKey<NavigatorState> navigatorKey;

  @override
  void dispose() {
    routerState.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  RouterConfiguration get currentConfiguration {
    return RouterConfiguration(routerState.routePath, routerState.browserState);
  }

  //todo: add state to check weather the user is authenticated and if not route to login page
  @override
  Future<void> setNewRoutePath(RouterConfiguration configuration) {
    routerState.routePath = configuration.path;
    routerState.browserState = configuration.browserState;
    return SynchronousFuture<void>(null);
  }

  @override
  Widget build(BuildContext context) {
    assert(routerState.routePath != null);
    return GalleryRouterStateScope(
      routerState: routerState,
      child: Navigator(
        key: navigatorKey,
        pages: [
          if (routerState.routePath is LoginPagePath)
            FadeAnimationPage(
              key: const ValueKey(LoginPagePath),
              child: const LoginPage(),
            )
          else
            MaterialPage<dynamic>(
                child: GalleryShell(routersState: routerState)),
        ],
        onPopPage: (route, dynamic result) {
          return route.didPop(result);
        },
      ),
    );
  }
}
