import 'package:flutter/material.dart';

const animationDuration = Duration(milliseconds: 500);
const animationCurve = Curves.easeInToLinear;
const fabHeight = 56.0;

class SettingsWidget extends StatefulWidget {
  SettingsWidget({
    Key? key,
    required this.scrollController,
    required this.gridView,
    required this.onGridViewIconTap,
    required this.onJumpIconTap,
  }) : super(key: key);

  final ScrollController scrollController;
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
  bool _showJumpButton = false;

  late final AnimationController gridViewAnimationController;
  late final AnimationController jumpButtonAnimationController;
  late final Animation<double> jumpButtonAnimation;

  @override
  void initState() {
    super.initState();
    gridViewAnimationController = AnimationController(
      vsync: this,
      duration: animationDuration,
    );
    jumpButtonAnimationController = AnimationController(
      vsync: this,
      duration: animationDuration,
    )..addListener(() => setState(() {}));
    jumpButtonAnimation = Tween<double>(
      begin: startPosition,
      end: endPosition,
    ).animate(CurvedAnimation(
      parent: jumpButtonAnimationController,
      curve: Curves.easeInOutBack,
    ));
    widget.scrollController.addListener(() {
      if (widget.scrollController.offset >= 200 && !_showJumpButton) {
        jumpButtonAnimationController.forward();
        _showJumpButton = true;
      }
      if (widget.scrollController.offset < 200 && _showJumpButton) {
        jumpButtonAnimationController.reverse();
        _showJumpButton = false;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    gridViewAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final girdViewIconColor = Colors.deepPurple;
    final baseIconColor = Colors.indigoAccent;

    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Transform(
            transform: Matrix4.translationValues(
              0.0,
              jumpButtonAnimation.value,
              0.0,
            ),
            child: FloatingActionButton(
              heroTag: 'Up',
              onPressed: () => widget.onJumpIconTap(),
              child: const Icon(Icons.arrow_upward),
            ),
          ),
          TweenAnimationBuilder<Color?>(
            tween: ColorTween(
              begin: widget.gridView ? baseIconColor : girdViewIconColor,
              end: widget.gridView ? girdViewIconColor : baseIconColor,
            ),
            duration: animationDuration,
            curve: animationCurve,
            builder: (context, color, child) => FloatingActionButton(
              heroTag: 'Grip',
              backgroundColor: color,
              onPressed: () {
                if (widget.gridView) {
                  gridViewAnimationController.forward();
                } else {
                  gridViewAnimationController.reverse();
                }
                widget.onGridViewIconTap();
              },
              child: AnimatedIcon(
                icon: AnimatedIcons.view_list,
                progress: gridViewAnimationController,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
