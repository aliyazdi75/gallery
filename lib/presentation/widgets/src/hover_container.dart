import 'package:flutter/material.dart';

class HoverContainer extends StatelessWidget {
  const HoverContainer(this.child);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 2.0),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          borderRadius: const BorderRadius.all(
            Radius.elliptical(50, 50),
          ),
        ),
        child: child,
      ),
    );
  }
}
