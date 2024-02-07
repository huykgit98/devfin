import 'package:devfin/app/app.dart';
import 'package:flutter/material.dart';

import 'custom_painter/liquid_painter.dart';
import 'custom_painter/radial_progress_painter.dart';

class CustomProgressWidget extends StatefulWidget {
  const CustomProgressWidget(
      {required this.darkMode,
      required this.backgroundGradientColors,
      required this.liquidGradient,
      super.key});
  final bool darkMode;
  final List<Color> backgroundGradientColors;
  final List<Color> liquidGradient;

  @override
  _ProgressWidgetState createState() => _ProgressWidgetState();
}

class _ProgressWidgetState extends State<CustomProgressWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isPlaying = false;
  int maxDuration = 2;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(seconds: maxDuration))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reset();
          _controller.forward();
        }
      });

    // Start the animation automatically when the widget is initialized
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            return Container(
              height: 64,
              width: 64,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: CustomPaint(
                      painter: LiquidPainter(
                        _controller.value * maxDuration,
                        maxDuration.toDouble(),
                        widget.liquidGradient,
                      ),
                    ),
                  ),
                  Image(
                    height: 64,
                    width: 64,
                    image: AssetImage(
                      widget.darkMode
                          ? Assets.icons.appIconDarkNoBackground.path
                          : Assets.icons.appIconNoBackground.path,
                    ),
                  ),
                  CustomPaint(
                    painter: RadialProgressPainter(
                      value: _controller.value * maxDuration,
                      backgroundGradientColors: widget.backgroundGradientColors,
                      minValue: 0,
                      maxValue: maxDuration.toDouble(),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
