import 'package:flutter/widgets.dart';

class FadeAnimationPage extends Page<dynamic> {
  final Widget child;

  FadeAnimationPage({LocalKey? key, required this.child}) : super(key: key);

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder<dynamic>(
      settings: this,
      pageBuilder: (context, animation, animation2) {
        var curveTween = CurveTween(curve: Curves.easeIn);
        return FadeTransition(
          opacity: animation.drive(curveTween),
          child: child,
        );
      },
    );
  }
}

//
// class NoAnimationMaterialPageRoute<T> extends MaterialPageRoute<T> {
//   NoAnimationMaterialPageRoute({
//     required WidgetBuilder builder,
//     RouteSettings? settings,
//   }) : super(builder: builder, settings: settings);
//
//   @override
//   Widget buildTransitions(
//     BuildContext context,
//     Animation<double> animation,
//     Animation<double> secondaryAnimation,
//     Widget child,
//   ) {
//     return child;
//   }
// }
