import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:routers_service/src/models/index.dart';

import 'routes.dart';

class GalleryRoutersState extends ChangeNotifier {
  GalleryRoutersState();

  GalleryRoutePath? get routePath => _routePath;
  GalleryRoutePath? _routePath;

  set routePath(GalleryRoutePath? value) {
    if (value != _routePath) {
      _routePath = value;
      notifyListeners();
    }
  }

  BrowserState? get browserState => _browserState;
  BrowserState? _browserState;

  set browserState(BrowserState? value) {
    if (value != _browserState) {
      _browserState = value;
      notifyListeners();
    }
  }
}

class GalleryRouterStateScope extends InheritedNotifier<GalleryRoutersState> {
  const GalleryRouterStateScope({
    Key? key,
    required GalleryRoutersState? routerState,
    required Widget child,
  }) : super(key: key, notifier: routerState, child: child);

  static GalleryRoutersState? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<GalleryRouterStateScope>()!
        .notifier;
  }
}
