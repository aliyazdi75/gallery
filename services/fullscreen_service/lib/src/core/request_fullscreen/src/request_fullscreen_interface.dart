import 'request_fullscreen_stub.dart'
    if (dart.library.html) 'web_request_fullscreen.dart'
    if (dart.library.io) 'non_web_request_fullscreen.dart';

abstract class RequestFullscreen {
  void requestFullscreen();

  void exitFullscreen();

  factory RequestFullscreen({Function? onEnter, Function? onExit}) =>
      getRequestFullscreen(onEnter: onEnter, onExit: onExit);
}
