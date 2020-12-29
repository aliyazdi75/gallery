import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'cursor_hover_stub.dart'
    if (dart.library.html) 'web_cursor_hover.dart'
    if (dart.library.io) 'desktop_cursor_hover.dart';

extension CursorHoverExtension on Widget {
  Widget showCursorOnHover(SystemMouseCursor cursorType, {Function onHovered}) {
    return MouseRegion(
      child: this,
      cursor: cursorType,
      onHover: (event) {
        if (onHovered != null) onHovered(true);
//        CursorHover().onHover(cursorType);
      },
      onExit: (event) {
        if (onHovered != null) onHovered(false);
//        CursorHover().onExit();
      },
    );
  }
}

abstract class CursorHover {
  void onHover(String cursorType);

  void onExit();

  factory CursorHover() => getCursorHover();
}
