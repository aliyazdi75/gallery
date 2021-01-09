import 'configure_non_web.dart' if (dart.library.html) 'configure_web.dart';

class UrlStrategy {
  static void configure() => configureApp();
}
