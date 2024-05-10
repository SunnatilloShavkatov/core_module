import "package:core_module/core/widgets/animations/speech_wave_animation.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

class SoundWaveAnimation extends StatefulWidget {
  const SoundWaveAnimation({
    required this.child,
    this.isListening = false,
    super.key,
  });

  final bool isListening;
  final Widget child;

  @override
  SoundWaveAnimationState createState() => SoundWaveAnimationState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>("isListening", isListening));
  }
}

class SoundWaveAnimationState extends State<SoundWaveAnimation>
    with TickerProviderStateMixin {
  late AnimationController animCtr;

  @override
  void initState() {
    super.initState();
    animCtr = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) => widget.isListening
      ? ScaleTransition(
          scale: Tween<double>(begin: 0.86, end: 1).animate(
            CurvedAnimation(
              parent: animCtr,
              curve: CurveWave(),
            ),
          ),
          child: widget.child,
        )
      : widget.child;

  @override
  void dispose() {
    animCtr.dispose();
    super.dispose();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<AnimationController>("animCtr", animCtr),
    );
  }
}
