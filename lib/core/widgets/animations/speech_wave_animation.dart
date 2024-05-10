import "dart:math" as math show pi, sin;

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

class SpeechWaveAnimation extends StatefulWidget {
  const SpeechWaveAnimation({
    required this.color,
    required this.scale,
    this.size = 120,
    super.key,
  });

  final Color color;
  final double size;
  final Tween<double> scale;

  @override
  State<SpeechWaveAnimation> createState() => _SpeechWaveAnimationState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ColorProperty("color", color))
      ..add(DiagnosticsProperty<Tween<double>>("scale", scale));
  }
}

class _SpeechWaveAnimationState extends State<SpeechWaveAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 1200),
    vsync: this,
  )..repeat();

  @override
  Widget build(BuildContext context) => ScaleTransition(
        scale: widget.scale.animate(
          CurvedAnimation(parent: _controller, curve: CurveWave()),
        ),
        child: CurveWaveWidget(color: widget.color, size: widget.size),
      );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class CurveWaveWidget extends StatelessWidget {
  const CurveWaveWidget({
    required this.color,
    required this.size,
    super.key,
  });

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) => CustomPaint(
        painter: CurveWavePainter(color: color),
        size: Size(size, size),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ColorProperty("color", color))
      ..add(DoubleProperty("size", size));
  }
}

class CurveWave extends Curve {
  @override
  double transform(double t) {
    if (t == 0 || t == 1) {
      return 0.1;
    }
    return math.sin(t * math.pi);
  }
}

class CurveWavePainter extends CustomPainter {
  const CurveWavePainter({
    required this.color,
  });

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final Path path_0 = Path()
      ..moveTo(size.width * 0.09411757, size.height * 0.2592977)
      ..cubicTo(
        size.width * 0.1316905,
        size.height * 0.2461834,
        size.width * 0.1679221,
        size.height * 0.2350488,
        size.width * 0.2035441,
        size.height * 0.2221544,
      )
      ..cubicTo(
        size.width * 0.2545410,
        size.height * 0.2036954,
        size.width * 0.2921932,
        size.height * 0.1696659,
        size.width * 0.3148577,
        size.height * 0.1187313,
      )
      ..cubicTo(
        size.width * 0.3562041,
        size.height * 0.02581129,
        size.width * 0.4700901,
        size.height * -0.02088230,
        size.width * 0.5640135,
        size.height * 0.01525825,
      )
      ..cubicTo(
        size.width * 0.6178063,
        size.height * 0.03595618,
        size.width * 0.6535225,
        size.height * 0.07503180,
        size.width * 0.6793108,
        size.height * 0.1223530,
      )
      ..cubicTo(
        size.width * 0.7105225,
        size.height * 0.1796226,
        size.width * 0.7580000,
        size.height * 0.2052069,
        size.width * 0.8166622,
        size.height * 0.2185484,
      )
      ..cubicTo(
        size.width * 0.8451216,
        size.height * 0.2250221,
        size.width * 0.8787838,
        size.height * 0.2273945,
        size.width * 0.8995991,
        size.height * 0.2447710,
      )
      ..cubicTo(
        size.width * 0.9338784,
        size.height * 0.2733880,
        size.width * 0.9699054,
        size.height * 0.3021419,
        size.width * 0.9854279,
        size.height * 0.3508631,
      )
      ..cubicTo(
        size.width * 1.010689,
        size.height * 0.4301645,
        size.width * 1.004982,
        size.height * 0.5022627,
        size.width * 0.9485586,
        size.height * 0.5632074,
      )
      ..cubicTo(
        size.width * 0.8961802,
        size.height * 0.6197788,
        size.width * 0.8789054,
        size.height * 0.6839724,
        size.width * 0.8903649,
        size.height * 0.7588894,
      )
      ..cubicTo(
        size.width * 0.9070135,
        size.height * 0.8677373,
        size.width * 0.8419730,
        size.height * 0.9577327,
        size.width * 0.7438378,
        size.height * 0.9847419,
      )
      ..cubicTo(
        size.width * 0.7014505,
        size.height * 0.9964101,
        size.width * 0.6569775,
        size.height * 0.9945253,
        size.width * 0.6160766,
        size.height * 0.9720276,
      )
      ..cubicTo(
        size.width * 0.5594820,
        size.height * 0.9408986,
        size.width * 0.5005450,
        size.height * 0.9424654,
        size.width * 0.4408689,
        size.height * 0.9601429,
      )
      ..cubicTo(
        size.width * 0.4311176,
        size.height * 0.9630323,
        size.width * 0.4222766,
        size.height * 0.9692719,
        size.width * 0.4131649,
        size.height * 0.9742535,
      )
      ..cubicTo(
        size.width * 0.3437770,
        size.height * 1.012157,
        size.width * 0.2739901,
        size.height * 1.004931,
        size.width * 0.2122658,
        size.height * 0.9621290,
      )
      ..cubicTo(
        size.width * 0.1488509,
        size.height * 0.9181521,
        size.width * 0.1123676,
        size.height * 0.8521705,
        size.width * 0.1247387,
        size.height * 0.7711935,
      )
      ..cubicTo(
        size.width * 0.1378658,
        size.height * 0.6852673,
        size.width * 0.1048135,
        size.height * 0.6204839,
        size.width * 0.04845090,
        size.height * 0.5640046,
      )
      ..cubicTo(
        size.width * 0.002633122,
        size.height * 0.5180922,
        size.width * -0.008517613,
        size.height * 0.4166862,
        size.width * 0.01503126,
        size.height * 0.3640516,
      )
      ..cubicTo(
        size.width * 0.03349676,
        size.height * 0.3227788,
        size.width * 0.05652207,
        size.height * 0.2870885,
        size.width * 0.09411757,
        size.height * 0.2592977,
      )
      ..close();

    final Paint paint0Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
