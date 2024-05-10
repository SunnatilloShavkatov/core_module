import "package:core_module/core/widgets/local_hero/src/rendering/controller.dart";
import "package:core_module/core/widgets/local_hero/src/rendering/layer.dart";
import "package:flutter/animation.dart";
import "package:flutter/rendering.dart";

class RenderLocalHeroLeaderLayer extends RenderProxyBox {
  /// Creates a render object that uses a [LeaderLayer].
  ///
  /// The [controller] must not be null.
  RenderLocalHeroLeaderLayer({
    required LocalHeroController controller,
    RenderBox? child,
  }) : super(child) {
    _controller = controller..addStatusListener(_onAnimationStatusChanged);
  }

  LocalHeroController get controller => _controller;
  late LocalHeroController _controller;

  set controller(LocalHeroController value) {
    if (_controller != value) {
      _controller.removeStatusListener(_onAnimationStatusChanged);
      _controller = value;
      _controller.addStatusListener(_onAnimationStatusChanged);
      markNeedsPaint();
    }
  }

  void _onAnimationStatusChanged(AnimationStatus status) {
    if (!attached) {
      return;
    }
    if (status == AnimationStatus.completed ||
        status == AnimationStatus.dismissed) {
      markNeedsPaint();
    }
  }

  @override
  bool get alwaysNeedsCompositing => true;

  @override
  bool hitTest(BoxHitTestResult result, {Offset? position}) =>
      !controller.isAnimating && super.hitTest(result, position: position!);

  @override
  void paint(PaintingContext context, Offset offset) {
    final Rect rect = Rect.fromPoints(offset, size.bottomRight(offset));
    _controller.animateIfNeeded(rect);

    if (layer == null) {
      layer = LeaderLayer(link: controller.link, offset: offset);
    } else {
      layer = (layer! as LeaderLayer)
        ..link = controller.link
        ..offset = offset;
    }

    final void Function(PaintingContext context, Offset offset) painter =
        controller.isAnimating
            ? (PaintingContext context, Offset offset) =>
                context.pushOpacity(offset, 0, super.paint)
            : super.paint;

    context.pushLayer(layer!, painter, Offset.zero);

    assert(layer != null, "");
  }

  @override
  void visitChildrenForSemantics(RenderObjectVisitor visitor) {
    if (!controller.isAnimating) {
      super.visitChildrenForSemantics(visitor);
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<LocalHeroController>("controller", controller),
    );
  }
}

class RenderLocalHeroFollowerLayer extends RenderProxyBox {
  RenderLocalHeroFollowerLayer({
    required LocalHeroController controller,
    RenderBox? child,
  }) : super(child) {
    _controller = controller..addListener(markNeedsLayout);
  }

  LocalHeroController get controller => _controller;
  late LocalHeroController _controller;

  set controller(LocalHeroController value) {
    if (_controller != value) {
      _controller.removeListener(markNeedsLayout);
      _controller = value;
      _controller.addListener(markNeedsLayout);
      markNeedsPaint();
    }
  }

  @override
  void detach() {
    layer = null;
    super.detach();
  }

  @override
  bool get alwaysNeedsCompositing => true;

  /// The layer we created when we were last painted.
  @override
  LocalHeroLayer? get layer => super.layer as LocalHeroLayer?;

  /// Return the transform that was used in the last composition phase, if any.
  ///
  /// If the [FollowerLayer] has not yet been created, was never composited, or
  /// was unable to determine the transform (see
  /// [FollowerLayer.getLastTransform]), this returns the identity matrix (see
  /// [Matrix4.identity].
  Matrix4 getCurrentTransform() =>
      layer?.getLastTransform() ?? Matrix4.identity();

  @override
  bool hitTest(BoxHitTestResult result, {Offset? position}) => false;

  @override
  void performLayout() {
    final Size? requestedSize = controller.linkedSize;
    final BoxConstraints childConstraints = requestedSize == null
        ? constraints
        : constraints.enforce(BoxConstraints.tight(requestedSize));
    child!.layout(childConstraints, parentUsesSize: true);
    size = constraints.constrain(child!.size);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (layer == null) {
      layer = LocalHeroLayer(controller: controller);
    } else {
      layer!.controller = controller;
    }

    context.pushLayer(
      layer!,
      super.paint,
      Offset.zero,
      childPaintBounds: const Rect.fromLTRB(
        double.negativeInfinity,
        double.negativeInfinity,
        double.infinity,
        double.infinity,
      ),
    );
  }

  @override
  void visitChildrenForSemantics(RenderObjectVisitor visitor) {
    if (controller.isAnimating) {
      super.visitChildrenForSemantics(visitor);
    }
  }

  @override
  void applyPaintTransform(RenderBox child, Matrix4 transform) {
    transform.multiply(getCurrentTransform());
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty<LocalHeroController>(
          "controller",
          controller,
        ),
      )
      ..add(
        TransformProperty(
          "current transform matrix",
          getCurrentTransform(),
        ),
      );
  }
}
