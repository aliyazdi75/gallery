import 'dart:html' as html;

import 'request_fullscreen_interface.dart';

class WebRequestFullscreen implements RequestFullscreen {
  WebRequestFullscreen({this.onEnter, this.onExit}) {
    appDocument = html.window.document;
    appDocument.onFullscreenChange.listen((event) {
      if (appDocument.fullscreenElement == null) {
        if (onExit != null) {
          onExit!();
        }
      } else {
        if (onEnter != null) {
          onEnter!();
        }
      }
    });
    appDocument.onKeyUp.listen((event) {
      if (event.key == 'F11') {
        if (appDocument.fullscreenElement == null) {
          if (onEnter != null) {
            appDocument.documentElement?.requestFullscreen();
          }
        }
      }
    });
  }

  final Function? onEnter;
  final Function? onExit;
  late html.Document appDocument;

  @override
  void requestFullscreen() {
    appDocument.documentElement?.requestFullscreen();
    if (onEnter != null) {
      onEnter!();
    }
  }

  @override
  void exitFullscreen({Function? onExit}) {
    if (appDocument.fullscreenElement != null) {
      appDocument.exitFullscreen();
    }
    if (onExit != null) {
      onExit();
    }
  }
}

RequestFullscreen getRequestFullscreen({Function? onEnter, Function? onExit}) =>
    WebRequestFullscreen(onEnter: onEnter, onExit: onExit);
