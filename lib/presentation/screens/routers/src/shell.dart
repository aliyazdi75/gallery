import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:options_service/options_service.dart';

import 'delegate.dart';
import 'state.dart';

class GalleryAppShell extends StatefulWidget {
  final GalleryRoutersState routersState;

  GalleryAppShell({@required this.routersState});

  @override
  _GalleryAppShellState createState() => _GalleryAppShellState();
}

class _GalleryAppShellState extends State<GalleryAppShell> {
  GalleryRoutersState _routersState;
  InnerRouterDelegate _routerDelegate;
  ChildBackButtonDispatcher _backButtonDispatcher;

  @override
  void initState() {
    super.initState();
    _routerDelegate = InnerRouterDelegate(widget.routersState);
  }

  @override
  void dispose() {
    super.dispose();
    widget.routersState.dispose();
  }

  @override
  void didUpdateWidget(covariant GalleryAppShell oldWidget) {
    super.didUpdateWidget(oldWidget);
    _routerDelegate.routersState = widget.routersState;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Defer back button dispatching to the child router
    _backButtonDispatcher = Router.of(context)
        .backButtonDispatcher
        .createChildBackButtonDispatcher();
  }

  @override
  Widget build(BuildContext context) {
    // Claim priority, If there are parallel sub router, you will need
    // to pick which one should take priority;
    _backButtonDispatcher.takePriority();

    return ApplyTextOptions(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: GalleryOptions.of(context).resolvedSystemUiOverlayStyle(context),
        child: Router(
          routerDelegate: _routerDelegate,
          backButtonDispatcher: _backButtonDispatcher,
        ),
      ),
    );
  }
}
