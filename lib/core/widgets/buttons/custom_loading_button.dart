import "package:core_module/core/utils/utils.dart";
import "package:core_module/core/widgets/loading/circular_progress_indicator.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

class CustomLoadingButton extends StatelessWidget {
  const CustomLoadingButton({
    required this.child,
    super.key,
    this.onPressed,
    this.isLoading = false,
  });

  final VoidCallback? onPressed;
  final Widget child;
  final bool isLoading;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: onPressed,
        child: AnimatedSwitcher(
          duration: kAnimationDuration,
          child: isLoading
              ? const CustomCircularProgressIndicator(
                  size: 24,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                )
              : child,
          layoutBuilder: (
            Widget? currentChild,
            List<Widget> currentChildKeys,
          ) =>
              Stack(
            children: <Widget>[
              ...currentChildKeys.map(
                (Widget currentChildKey) => Positioned.fill(
                  child: currentChildKey,
                ),
              ),
              if (currentChild != null) Align(child: currentChild),
            ],
          ),
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ObjectFlagProperty<void Function()?>.has("onPressed", onPressed))
      ..add(DiagnosticsProperty<bool>("isLoading", isLoading));
  }
}
