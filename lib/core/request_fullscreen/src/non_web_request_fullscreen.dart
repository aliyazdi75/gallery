import 'package:flutter/services.dart';

import 'request_fullscreen_interface.dart';

class NonWebRequestFullscreen implements RequestFullscreen {
  NonWebRequestFullscreen({this.onEnter, this.onExit});

  final Function onEnter;
  final Function onExit;

  @override
  void requestFullscreen() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    if (onEnter != null) {
      onEnter();
    }
  }

  @override
  void exitFullscreen() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    if (onExit != null) {
      onExit();
    }
  }
}

RequestFullscreen getRequestFullscreen({Function onEnter, Function onExit}) =>
    NonWebRequestFullscreen(onEnter: onEnter, onExit: onExit);
