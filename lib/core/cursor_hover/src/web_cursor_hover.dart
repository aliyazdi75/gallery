import 'dart:html' as html;

import 'package:ceit_alumni/data/constants/src/app.dart';

import 'cursor_hover_interface.dart';
import 'cursor_type.dart';

class WebHover implements CursorHover {
  WebHover() {
    appContainer = html.window.document.getElementById(ceitAlumniTitle);
  }

  html.Element appContainer;

  @override
  void onHover(String cursorType) => appContainer.style.cursor = cursorType;

  @override
  void onExit() => appContainer.style.cursor = CursorType.defaults;
}

CursorHover getCursorHover() => WebHover();
