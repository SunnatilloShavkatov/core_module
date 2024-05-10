import "package:core_module/core/utils/utils.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

class AnimationLinearProgress extends StatelessWidget {
  const AnimationLinearProgress({
    super.key,
    this.value,
    this.minHeight,
    this.backgroundColor,
    this.valueColor,
  });

  final double? value;
  final double? minHeight;
  final Color? backgroundColor;
  final Animation<Color?>? valueColor;

  @override
  Widget build(BuildContext context) => TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
        tween: Tween<double>(begin: 0, end: value),
        builder: (_, double value, __) => LinearProgressIndicator(
          borderRadius: AppUtils.kBorderRadius4,
          value: value,
          minHeight: minHeight,
          backgroundColor: backgroundColor,
          valueColor:
              valueColor ?? const AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DoubleProperty("value", value))
      ..add(DoubleProperty("minHeight", minHeight))
      ..add(ColorProperty("backgroundColor", backgroundColor))
      ..add(DiagnosticsProperty<Animation<Color?>?>("valueColor", valueColor));
  }
}
