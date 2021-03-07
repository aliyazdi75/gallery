import 'package:flutter/material.dart';

const animationDuration = Duration(milliseconds: 250);
const animationCurve = Curves.easeInOutBack;
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
  bool _jumpButtonExist = false;

  late double _scrollControllerOffset;
  late final AnimationController gridViewAnimationController;
  late final AnimationController jumpButtonAnimationController;
  late final Animation<double> jumpButtonAnimation;

  @override
  void initState() {
    super.initState();
    _scrollControllerOffset = widget.scrollController.offset;
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
      curve: animationCurve,
    ));
    widget.scrollController.addListener(() {
      _scrollControllerOffset = widget.scrollController.offset;
      if (_scrollControllerOffset >= 200 && !_jumpButtonExist) {
        _showJumpButton();
      }
      if (_scrollControllerOffset < 200 && _jumpButtonExist) {
        _hideJumpButton();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    gridViewAnimationController.dispose();
    jumpButtonAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final girdViewIconColor = Colors.deepPurple;
    final baseIconColor = Colors.indigoAccent;

    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Column(
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
          Transform.translate(
            offset: const Offset(0.0, -1 * fabHeight),
            child: TweenAnimationBuilder<Color?>(
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
                    _hideJumpButton();
                  } else {
                    gridViewAnimationController.reverse();
                    if (_scrollControllerOffset >= 200 && !_jumpButtonExist) {
                      _showJumpButton();
                    }
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
          ),
        ],
      ),
    );
  }

  void _showJumpButton() {
    jumpButtonAnimationController..forward();
    _jumpButtonExist = true;
  }

  void _hideJumpButton() {
    jumpButtonAnimationController.reverse();
    _jumpButtonExist = false;
  }
}
