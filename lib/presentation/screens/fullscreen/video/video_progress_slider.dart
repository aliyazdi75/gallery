import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_service/video_service.dart';

const playedColor = Color.fromRGBO(255, 0, 0, 0.7);
const bufferedColor = Color.fromRGBO(200, 200, 200, 0.8);
const backgroundColor = Color.fromRGBO(200, 200, 200, 0.5);

class VideoProgressSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoBloc, VideoState>(
      builder: (context, state) {
        final sliderHeight = 6.0;
        final thumbSize = state.isShowingController ? 8.0 : 0.0;
        final duration = state.duration?.inMilliseconds;
        final position = state.position?.inMilliseconds;
        var maxBuffering = 0;
        for (var range in state.buffered) {
          final end = range.end.inMilliseconds;
          if (end > maxBuffering) {
            maxBuffering = end;
          }
        }
        if (duration == null && position == null) {
          return const LinearProgressIndicator(
            value: null,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            backgroundColor: backgroundColor,
          );
        }
        return Directionality(
          textDirection: TextDirection.ltr,
          child: Container(
            height: 8.0,
            child: Stack(
              fit: StackFit.loose,
              children: [
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    disabledActiveTrackColor: bufferedColor,
                    disabledInactiveTrackColor: backgroundColor,
                    overlayShape: SliderComponentShape.noOverlay,
                    thumbShape: SliderComponentShape.noThumb,
                    trackHeight: sliderHeight,
                    trackShape: const RectangularSliderTrackShape(
                        disabledThumbGapWidth: 0.0),
                  ),
                  child: Slider.adaptive(
                    divisions: duration.toInt(),
                    max: duration.toDouble(),
                    min: 0.0,
                    onChanged: null,
                    value: maxBuffering.toDouble(),
                  ),
                ),
                TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: thumbSize, end: thumbSize),
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.linear,
                  builder: (context, size, child) {
                    return SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: playedColor,
                        inactiveTrackColor: Colors.transparent,
                        overlayShape: SliderComponentShape.noOverlay,
                        thumbColor: Colors.white,
                        trackHeight: sliderHeight,
                        trackShape: const RectangularSliderTrackShape(
                            disabledThumbGapWidth: 0.0),
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: size,
                        ),
                      ),
                      child: Slider.adaptive(
                        divisions: duration.toInt(),
                        label: '${state.positionText}',
                        max: duration.toDouble(),
                        min: 0.0,
                        onChanged: (value) {
                          state.videoPlayerController.seekTo(
                            Duration(
                              milliseconds: value.toInt(),
                            ),
                          );
                        },
                        onChangeEnd: (value) {
                          state.videoPlayerController.seekTo(
                            Duration(
                              milliseconds: value.toInt(),
                            ),
                          );
                        },
                        value: position.toDouble(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
