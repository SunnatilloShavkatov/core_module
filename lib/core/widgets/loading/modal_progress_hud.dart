import "package:core_module/core/widgets/loading/circular_progress_indicator.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

class ModalProgressHUD extends StatelessWidget {
  const ModalProgressHUD({
    required this.child,
    super.key,
    this.inAsyncCall = false,
    this.opacity = 0.3,
    this.color,
    this.progressIndicator = const CustomCircularProgressIndicator(),
    this.dismissible = false,
    this.hasChild = false,
  });

  final bool inAsyncCall;
  final double opacity;
  final Color? color;
  final Widget progressIndicator;
  final bool dismissible;
  final Widget child;
  final bool hasChild;

  @override
  Widget build(BuildContext context) => Stack(
        children: <Widget>[
          Offstage(
            key: const Key("child"),
            offstage: !hasChild && inAsyncCall,
            child: child,
          ),
          Offstage(
            key: const Key("modalBarrier"),
            offstage: !inAsyncCall,
            child: AnimatedOpacity(
              opacity: opacity,
              duration: const Duration(milliseconds: 100),
              child: ModalBarrier(dismissible: dismissible, color: color),
            ),
          ),
          Offstage(
            key: const Key("progressIndicator"),
            offstage: !inAsyncCall,
            child: Center(child: progressIndicator),
          ),
        ],
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<bool>("inAsyncCall", inAsyncCall))
      ..add(DoubleProperty("opacity", opacity))
      ..add(ColorProperty("color", color))
      ..add(DiagnosticsProperty<bool>("dismissible", dismissible));
  }
}
