import 'package:ceit_alumni/data/models/gallery/index.dart';
import 'package:ceit_alumni/presentation/screens/album/view/image/image_widget.dart';
import 'package:flutter/material.dart';

const kIconSizeSelected = 0.6;
const kIconSizeUnselected = 0.25;

class VideoImageWidget extends StatelessWidget {
  VideoImageWidget({
    @required this.index,
    @required this.isSelected,
    @required this.media,
    @required this.containerHeight,
    @required this.selectionAnimationDuration,
    @required this.selectionAnimationCurve,
    @required this.onTap,
  });

  final int index;
  final bool isSelected;
  final Media media;
  final double containerHeight;
  final Duration selectionAnimationDuration;
  final Curve selectionAnimationCurve;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final playIconSize = isSelected
        ? containerHeight * kIconSizeSelected
        : containerHeight * kIconSizeUnselected;
    final stackedWidget = [
      Positioned.fill(
        child: Opacity(
          opacity: 0.3,
          child: Container(
            color: Colors.black,
          ),
        ),
      ),
      TweenAnimationBuilder<double>(
        tween: Tween<double>(
          begin: playIconSize,
          end: playIconSize,
        ),
        duration: selectionAnimationDuration,
        curve: selectionAnimationCurve,
        builder: (context, size, child) {
          return Icon(
            Icons.play_circle_outline,
            color: Colors.white,
            size: size,
          );
        },
      ),
    ];
    return ImageWidget(
      index: index,
      isSelected: isSelected,
      media: media,
      containerHeight: containerHeight,
      selectionAnimationDuration: selectionAnimationDuration,
      selectionAnimationCurve: selectionAnimationCurve,
      onTap: onTap,
      stackedWidget: stackedWidget,
    );
  }
}
