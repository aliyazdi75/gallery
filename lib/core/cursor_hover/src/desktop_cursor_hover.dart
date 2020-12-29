import 'cursor_hover_interface.dart';

class DesktopHover implements CursorHover {
  DesktopHover();

  @override
  void onHover(String cursorType) => null;

  @override
  void onExit() => null;
}

CursorHover getCursorHover() => DesktopHover();
