import "dart:math" as math;
import "dart:math" show cos, pi, sin;

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

const List<Color> defaultGraphColors = <Color>[
  Color(0xFFFFA200),
  Color(0xFF51A3FE),
  Color(0xFF8DD54F),
  Color(0xFFFF2522),
  Color(0xFFFF8AD1),
  Color(0xFF26004D),
];

class RadarChart extends StatefulWidget {
  const RadarChart({
    required this.features,
    required this.data,
    required this.size,
    this.ticks = const <int>[20, 40, 60, 80, 100],
    super.key,
    this.reverseAxis = false,
    this.ticksTextStyle = const TextStyle(color: Colors.grey, fontSize: 12),
    this.featuresTextStyle = const TextStyle(fontSize: 10),
    this.outlineColor = Colors.black,
    this.axisColor = Colors.grey,
    this.graphColors = defaultGraphColors,
    this.sides = 0,
  });

  factory RadarChart.light({
    required List<int> ticks,
    required List<String> features,
    required List<List<num>> data,
    required double size,
    bool reverseAxis = false,
    bool useSides = false,
  }) =>
      RadarChart(
        size: size,
        ticks: ticks,
        features: features,
        data: data,
        reverseAxis: reverseAxis,
        sides: useSides ? features.length : 0,
      );

  factory RadarChart.dark({
    required List<int> ticks,
    required List<String> features,
    required List<List<num>> data,
    required double size,
    bool reverseAxis = false,
    bool useSides = false,
  }) =>
      RadarChart(
        size: size,
        ticks: ticks,
        features: features,
        data: data,
        featuresTextStyle: const TextStyle(color: Colors.white, fontSize: 16),
        outlineColor: Colors.white,
        reverseAxis: reverseAxis,
        sides: useSides ? features.length : 0,
      );

  final List<int> ticks;
  final List<String> features;
  final List<List<num>> data;
  final bool reverseAxis;
  final TextStyle ticksTextStyle;
  final TextStyle featuresTextStyle;
  final Color outlineColor;
  final Color axisColor;
  final List<Color> graphColors;
  final int sides;
  final double size;

  @override
  State<RadarChart> createState() => _RadarChartState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IntProperty("sides", sides))
      ..add(IterableProperty<Color>("graphColors", graphColors))
      ..add(IterableProperty<int>("ticks", ticks))
      ..add(IterableProperty<String>("features", features))
      ..add(IterableProperty<List<num>>("data", data))
      ..add(DiagnosticsProperty<bool>("reverseAxis", reverseAxis))
      ..add(DiagnosticsProperty<TextStyle>("ticksTextStyle", ticksTextStyle))
      ..add(
        DiagnosticsProperty<TextStyle>(
          "featuresTextStyle",
          featuresTextStyle,
        ),
      )
      ..add(ColorProperty("outlineColor", outlineColor))
      ..add(ColorProperty("axisColor", axisColor))
      ..add(DoubleProperty("size", size));
  }
}

class _RadarChartState extends State<RadarChart>
    with SingleTickerProviderStateMixin {
  double fraction = 0;
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        curve: Curves.fastOutSlowIn,
        parent: animationController,
      ),
    )..addListener(() {
        setState(() {
          fraction = animation.value;
        });
      });

    animationController.forward();
  }

  @override
  void didUpdateWidget(RadarChart oldWidget) {
    super.didUpdateWidget(oldWidget);
    // animationController
    //   ..reset()
    //   ..forward();
  }

  @override
  Widget build(BuildContext context) => widget.sides == 0
      ? const SizedBox.shrink()
      : CustomPaint(
          size: Size(widget.size, widget.size),
          painter: RadarChartPainter(
            ticks: widget.ticks,
            features: widget.features,
            data: widget.data,
            reverseAxis: widget.reverseAxis,
            ticksTextStyle: widget.ticksTextStyle,
            featuresTextStyle: widget.featuresTextStyle,
            outlineColor: widget.outlineColor,
            axisColor: widget.axisColor,
            graphColors: widget.graphColors,
            sides: widget.sides,
            fraction: fraction,
          ),
        );

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DoubleProperty("fraction", fraction))
      ..add(DiagnosticsProperty<Animation<double>>("animation", animation))
      ..add(
        DiagnosticsProperty<AnimationController>(
          "animationController",
          animationController,
        ),
      );
  }
}

class RadarChartPainter extends CustomPainter {
  RadarChartPainter({
    required this.ticks,
    required this.features,
    required this.data,
    required this.reverseAxis,
    required this.ticksTextStyle,
    required this.featuresTextStyle,
    required this.outlineColor,
    required this.axisColor,
    required this.graphColors,
    required this.sides,
    required this.fraction,
  });

  final List<int> ticks;
  final List<String> features;
  final List<List<num>> data;
  final bool reverseAxis;
  final TextStyle ticksTextStyle;
  final TextStyle featuresTextStyle;
  final Color outlineColor;
  final Color axisColor;
  final List<Color> graphColors;
  final int sides;
  final double fraction;

  Path variablePath(Size size, double radius, int sides) {
    final Path path = Path();
    final double angle = (math.pi * 2) / sides;

    final Offset center = Offset(size.width / 2, size.height / 2);

    if (sides < 3) {
      // Draw a circle
      path.addOval(
        Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: radius,
        ),
      );
    } else {
      // Draw a polygon
      final Offset startPoint =
          Offset(radius * cos(-pi / 2), radius * sin(-pi / 2));

      path.moveTo(startPoint.dx + center.dx, startPoint.dy + center.dy);

      for (int i = 1; i <= sides; i++) {
        final double x = radius * cos(angle * i - pi / 2) + center.dx;
        final double y = radius * sin(angle * i - pi / 2) + center.dy;
        path.lineTo(x, y);
      }
      path.close();
    }
    return path;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final double centerX = size.width / 2.0;
    final double centerY = size.height / 2.0;
    final Offset centerOffset = Offset(centerX, centerY);
    final double radius = math.min(centerX, centerY);
    final double scale = radius / ticks.last;

    // Painting the chart outline
    final Paint outlinePaint = Paint()
      ..color = outlineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..isAntiAlias = true;

    final Paint ticksPaint = Paint()
      ..color = axisColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..isAntiAlias = true;

    canvas.drawPath(variablePath(size, radius, sides), outlinePaint);
    // Painting the circles and labels for the given ticks
    // (could be auto-generated)
    // The last tick is ignored, since it overlaps with the feature label
    final double tickDistance = radius / (ticks.length);
    final List<int> tickLabels = reverseAxis ? ticks.reversed.toList() : ticks;

    if (reverseAxis) {
      TextPainter(
        text: TextSpan(text: tickLabels[0].toString(), style: ticksTextStyle),
        textDirection: TextDirection.ltr,
      )
        ..layout(maxWidth: size.width)
        ..paint(canvas, Offset(centerX, centerY - ticksTextStyle.fontSize!));
    }

    tickLabels
        .sublist(
          reverseAxis ? 1 : 0,
          reverseAxis ? ticks.length : ticks.length - 1,
        )
        .asMap()
        .forEach((int index, int tick) {
      final double tickRadius = tickDistance * (index + 1);

      canvas.drawPath(variablePath(size, tickRadius, sides), ticksPaint);

      TextPainter(
        text: TextSpan(text: tick.toString(), style: ticksTextStyle),
        textDirection: TextDirection.ltr,
      )
        ..layout(maxWidth: size.width)
        ..paint(
          canvas,
          Offset(centerX, centerY - tickRadius - ticksTextStyle.fontSize!),
        );
    });

    // Painting the axis for each given feature
    final double angle = (2 * pi) / features.length;

    features.asMap().forEach((int index, String feature) {
      final double xAngle = cos(angle * index - pi / 2);
      final double yAngle = sin(angle * index - pi / 2);

      final Offset featureOffset =
          Offset(centerX + radius * xAngle, centerY + radius * yAngle);

      canvas.drawLine(centerOffset, featureOffset, ticksPaint);

      final double? featureLabelFontHeight = featuresTextStyle.fontSize;
      final num labelYOffset = yAngle < 0 ? -featureLabelFontHeight! : 0;
      final double labelXOffset = xAngle > 0 ? featureOffset.dx : 0.0;

      TextPainter(
        text: TextSpan(text: feature, style: featuresTextStyle),
        textAlign: xAngle < 0 ? TextAlign.right : TextAlign.left,
        textDirection: TextDirection.ltr,
      )
        ..layout(minWidth: featureOffset.dx)
        ..paint(canvas, Offset(labelXOffset, featureOffset.dy + labelYOffset));
    });

    // Painting each graph
    data.asMap().forEach((int index, List<num> graph) {
      final Paint graphPaint = Paint()
        ..color = graphColors[index % graphColors.length].withOpacity(0.3)
        ..style = PaintingStyle.fill;

      final Paint graphOutlinePaint = Paint()
        ..color = graphColors[index % graphColors.length]
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1
        ..isAntiAlias = true;

      // Start the graph on the initial point
      final double scaledPoint = scale * graph[0] * fraction;
      final Path path = Path();

      if (reverseAxis) {
        path.moveTo(centerX, centerY - (radius * fraction - scaledPoint));
      } else {
        path.moveTo(centerX, centerY - scaledPoint);
      }

      graph.asMap().forEach((int index, num point) {
        if (index == 0) {
          return;
        }

        final double xAngle = cos(angle * index - pi / 2);
        final double yAngle = sin(angle * index - pi / 2);
        final double scaledPoint = scale * point * fraction;

        if (reverseAxis) {
          path.lineTo(
            centerX + (radius * fraction - scaledPoint) * xAngle,
            centerY + (radius * fraction - scaledPoint) * yAngle,
          );
        } else {
          path.lineTo(
            centerX + scaledPoint * xAngle,
            centerY + scaledPoint * yAngle,
          );
        }
      });

      path.close();
      canvas
        ..drawPath(path, graphPaint)
        ..drawPath(path, graphOutlinePaint);
    });
  }

  @override
  bool shouldRepaint(RadarChartPainter oldDelegate) =>
      oldDelegate.fraction != fraction;
}
