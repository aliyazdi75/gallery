import 'package:flutter/material.dart';
import 'package:routers_service/routers_service.dart';

import 'router.dart';

class GalleryShell extends StatefulWidget {
  final GalleryRoutersState routersState;

  GalleryShell({required this.routersState});

  @override
  _GalleryShellState createState() => _GalleryShellState();
}

class _GalleryShellState extends State<GalleryShell> {
  late InnerGalleryRouterDelegate _routerDelegate;
  late ChildBackButtonDispatcher _backButtonDispatcher;

  @override
  void initState() {
    super.initState();
    _routerDelegate = InnerGalleryRouterDelegate(widget.routersState);
  }

  @override
  void dispose() {
    super.dispose();
    widget.routersState.dispose();
  }

  @override
  void didUpdateWidget(covariant GalleryShell oldWidget) {
    super.didUpdateWidget(oldWidget);
    _routerDelegate.routersState = widget.routersState;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Defer back button dispatching to the child router
    _backButtonDispatcher = Router.of(context)
        .backButtonDispatcher!
        .createChildBackButtonDispatcher();
  }

  @override
  Widget build(BuildContext context) {
    // Claim priority, If there are parallel sub router, you will need
    // to pick which one should take priority;

    _backButtonDispatcher.takePriority();

    return Router(
      routerDelegate: _routerDelegate,
      backButtonDispatcher: _backButtonDispatcher,
    );
  }
}
