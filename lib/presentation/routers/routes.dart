import 'package:animations/animations.dart';
import 'package:ceit_alumni/main.dart';
import 'package:ceit_alumni/presentation/screens/gallery/index.dart';
import 'package:ceit_alumni/presentation/screens/home/home.dart';
import 'package:ceit_alumni/presentation/screens/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef PathWidgetBuilder = Widget Function(BuildContext, String, Object);

//todo: add state to check weather the user is authenticated and if not route to login page
class Path {
  const Path(this.pattern, this.builder);

  /// A RegEx string for route matching.
  final String pattern;

  /// The builder for the associated pattern route. The first argument is the
  /// [BuildContext] and the second argument a RegEx match if that is included
  /// in the pattern.
  ///
  /// ```dart
  /// Path(
  ///   'r'^/demo/([\w-]+)$',
  ///   (context, matches) => Page(argument: match),
  /// )
  /// ```
  final PathWidgetBuilder builder;
}

class RouteConfiguration {
  /// List of [Path] to for route matching. When a named route is pushed with
  /// [Navigator.pushNamed], the route name is matched with the [Path.pattern]
  /// in the list below. As soon as there is a match, the associated builder
  /// will be returned. This means that the paths higher up in the list will
  /// take priority.
  static List<Path> paths = [
    // Path(
    //   r'^' + DemoPage.baseRoute + r'/([\w-]+)$',
    //   (context, match) => DemoPage(slug: match),
    // ),
    // Path(
    //   r'^' + RallyApp.homeRoute,
    //   (context, match) => const StudyWrapper(study: RallyApp()),
    // ),
    // Path(
    //   r'^' + ShrineApp.homeRoute,
    //   (context, match) => const StudyWrapper(study: ShrineApp()),
    // ),
    // Path(
    //   r'^' + CraneApp.defaultRoute,
    //   (context, match) => const StudyWrapper(study: CraneApp()),
    // ),
    // Path(
    //   r'^' + FortnightlyApp.defaultRoute,
    //   (context, match) => const StudyWrapper(study: FortnightlyApp()),
    // ),
    // Path(
    //   r'^' + StarterApp.defaultRoute,
    //   (context, match) => const StudyWrapper(study: StarterApp()),
    // ),
    Path(
      r'^' +
          MediaGallery.galleryRoute +
          GalleryMediaFullscreen.mediaGalleryRoute +
          r'/(.+)$',
      (context, match, args) {
        assert(args != null);
        final arguments = args as GalleryMediaArguments;
        return GalleryMediaFullscreen(
          url: arguments.url,
          thumbnail: arguments.thumbnail,
          isImage: arguments.isImage,
        );
      },
    ),
    Path(
      r'^' + HomePage.homeRoute,
      (context, match, args) {
        assert(args != null);
        final arguments = args as HomePageArguments;
        return HomePage(
          galleryRepository: arguments.galleryRepository,
        );
      },
    ),
    Path(
      r'^' + LoginPage.loginRoute,
      (context, match, args) => const LoginPage(),
    ),
    // root with '/' prefix should be last
    Path(
      r'^/',
      (context, match, args) => const RootPage(),
    ),
  ];

  /// The route generator callback used when the app is navigated to a named
  /// route. Set it on the [MaterialApp.onGenerateRoute] or
  /// [WidgetsApp.onGenerateRoute] to make use of the [paths] for route
  /// matching.
  static Route<dynamic> onGenerateMaterialRoute(RouteSettings settings) {
    for (final path in paths) {
      final regExpPattern = RegExp(path.pattern);
      if (regExpPattern.hasMatch(settings.name)) {
        final firstMatch = regExpPattern.firstMatch(settings.name);
        final match = (firstMatch.groupCount == 1) ? firstMatch.group(1) : null;
        if (kIsWeb) {
          return PageRouteBuilder<void>(
            pageBuilder: (context, animation, secondaryAnimation) =>
                path.builder(context, match, settings.arguments),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeThroughTransition(
                fillColor: Theme.of(context).cardColor,
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              );
            },
            settings: settings,
          );
        }
        return MaterialPageRoute<void>(
          builder: (context) =>
              path.builder(context, match, settings.arguments),
          settings: settings,
        );
      }
    }

    // If no match was found, we let [WidgetsApp.onUnknownRoute] handle it.
    return null;
  }

  /// The route generator callback used when the app is navigated to a named
  /// route. Set it on the [MaterialApp.onGenerateRoute] or
  /// [WidgetsApp.onGenerateRoute] to make use of the [paths] for route
  /// matching.
  static Route<dynamic> onGenerateCupertinoRoute(RouteSettings settings) {
    for (final path in paths) {
      final regExpPattern = RegExp(path.pattern);
      if (regExpPattern.hasMatch(settings.name)) {
        final firstMatch = regExpPattern.firstMatch(settings.name);
        final match = (firstMatch.groupCount == 1) ? firstMatch.group(1) : null;

        return CupertinoPageRoute<void>(
          builder: (context) => path.builder(
            context,
            match,
            settings.arguments,
          ),
          settings: settings,
        );
      }
    }

    // If no match was found, we let [WidgetsApp.onUnknownRoute] handle it.
    return null;
  }
}

class NoAnimationMaterialPageRoute<T> extends MaterialPageRoute<T> {
  NoAnimationMaterialPageRoute({
    @required WidgetBuilder builder,
    RouteSettings settings,
  }) : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}
