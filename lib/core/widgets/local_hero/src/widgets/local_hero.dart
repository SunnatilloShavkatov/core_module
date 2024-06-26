import "package:core_module/core/widgets/local_hero/src/rendering/controller.dart";
import "package:core_module/core/widgets/local_hero/src/widgets/local_hero_layer.dart";
import "package:core_module/core/widgets/local_hero/src/widgets/local_hero_scope.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";

/// A function that lets [LocalHero]es self supply a [Widget] that is shown
/// during the local hero's flight from one position to another instead of
/// default (which is to show the child instance of the [LocalHero]).
typedef LocalHeroFlightShuttleBuilder = Widget Function(
  BuildContext context,
  Animation<double> animation,
  Widget child,
);

/// Mark its child as a candidate for local hero animation.
///
/// When the position of this widget (from the perspective of Flutter) changes,
/// an animation is started from the previous position to the new one.
///
/// You'll have to use a [Key] in the top most parent in your container in order
/// to explicitly tell the framework to preserve the state of your children.
class LocalHero extends StatefulWidget {
  /// Creates a [LocalHero].
  ///
  /// If between two frames, the position of a [LocalHero] with the same tag
  /// changes, a local hero animation will be triggered.
  const LocalHero({
    required this.tag,
    required this.child,
    super.key,
    this.flightShuttleBuilder,
    this.enabled = true,
  });

  /// The identifier for this particular local hero. This tag must be unique
  /// under the same [LocalHeroScope].
  /// If between two frames, the position of a [LocalHero] with the same tag
  /// changes, a local hero animation will be triggered.
  final Object tag;

  /// Optional override to supply a widget that's shown during the local hero's
  /// flight.
  ///
  /// If none is provided, the child is shown in-flight by default.
  final LocalHeroFlightShuttleBuilder? flightShuttleBuilder;

  /// Whether the hero animation should be enabled.
  final bool enabled;

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.child}
  final Widget child;

  @override
  State<LocalHero> createState() => _LocalHeroState();
}

class _LocalHeroState extends State<LocalHero>
    with SingleTickerProviderStateMixin<LocalHero> {
  late LocalHeroController controller;
  late LocalHeroScopeState scopeState;

  @override
  void initState() {
    super.initState();
    scopeState = context.getLocalHeroScopeState();
    controller = scopeState.track(context, widget);
  }

  @override
  void dispose() {
    scopeState.unTrack(widget);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.enabled
      ? LocalHeroLeader(
          controller: controller,
          child: widget.child,
        )
      : widget.child;
}

class LocalHeroOverlay extends StatelessWidget {
  const LocalHeroOverlay({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) => ClipRect(
        child: Overlay(
          initialEntries: <OverlayEntry>[
            OverlayEntry(builder: (_) => child),
          ],
        ),
      );
}
