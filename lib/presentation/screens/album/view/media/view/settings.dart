import 'package:flutter/material.dart';

const animationDuration = Duration(milliseconds: 500);
const animationCurve = Curves.easeInToLinear;
const fabHeight = 56.0;

class SettingsWidget extends StatefulWidget {
  SettingsWidget({
    Key key,
    this.showJumpButton,
    this.gridView,
    this.onGridViewIconTap,
    this.onJumpIconTap,
  }) : super(key: key);

  final bool showJumpButton;
  final bool gridView;
  final Function onGridViewIconTap;
  final Function onJumpIconTap;

  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget>
    with TickerProviderStateMixin {
  final startPosition = 0.0;
  final endPosition = fabHeight + 10.0;

  AnimationController _gridViewAnimationController;

  @override
  void initState() {
    super.initState();
    _gridViewAnimationController = AnimationController(
      vsync: this,
      duration: animationDuration,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _gridViewAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final girdViewIconColor = Colors.deepPurple;
    final baseIconColor = Colors.indigoAccent;

    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          TweenAnimationBuilder<double>(
            tween: Tween<double>(
              begin: widget.showJumpButton && widget.gridView
                  ? startPosition
                  : endPosition,
              end: widget.showJumpButton && widget.gridView
                  ? endPosition
                  : startPosition,
            ),
            duration: animationDuration,
            curve: animationCurve,
            builder: (context, size, child) => Transform(
              transform: Matrix4.translationValues(
                0.0,
                size,
                0.0,
              ),
              child: FloatingActionButton(
                onPressed: () => widget.onJumpIconTap(),
                child: const Icon(Icons.arrow_upward),
              ),
            ),
          ),
          TweenAnimationBuilder<Color>(
            tween: ColorTween(
              begin: widget.gridView ? baseIconColor : girdViewIconColor,
              end: widget.gridView ? girdViewIconColor : baseIconColor,
            ),
            duration: animationDuration,
            curve: animationCurve,
            builder: (context, color, child) => FloatingActionButton(
              backgroundColor: color,
              onPressed: () {
                if (widget.gridView) {
                  _gridViewAnimationController.forward();
                } else {
                  _gridViewAnimationController.reverse();
                }
                widget.onGridViewIconTap();
              },
              child: AnimatedIcon(
                icon: AnimatedIcons.view_list,
                progress: _gridViewAnimationController,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
