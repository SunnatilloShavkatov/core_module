import "package:core_module/core/widgets/local_hero/src/rendering/controller.dart";
import "package:core_module/core/widgets/local_hero/src/rendering/local_hero_layer.dart";
import "package:flutter/widgets.dart";

class LocalHeroFollower extends SingleChildRenderObjectWidget {
  const LocalHeroFollower({
    required this.controller,
    super.key,
    super.child,
  });

  final LocalHeroController controller;

  @override
  LocalHeroFollowerElement createElement() => LocalHeroFollowerElement(this);

  @override
  RenderLocalHeroFollowerLayer createRenderObject(BuildContext context) =>
      RenderLocalHeroFollowerLayer(controller: controller);

  @override
  void updateRenderObject(
    BuildContext context,
    RenderLocalHeroFollowerLayer renderObject,
  ) {
    renderObject.controller = controller;
  }
}

class LocalHeroFollowerElement extends SingleChildRenderObjectElement {
  LocalHeroFollowerElement(LocalHeroFollower super.widget);

  @override
  LocalHeroFollower get widget => super.widget as LocalHeroFollower;

  @override
  void debugVisitOnstageChildren(ElementVisitor visitor) {
    if (widget.controller.isAnimating) {
      super.debugVisitOnstageChildren(visitor);
    }
  }
}

class LocalHeroLeader extends SingleChildRenderObjectWidget {
  /// Creates a composited transform target widget.
  ///
  /// The [] property must not be null, and must not be currently being used
  /// by any other [CompositedTransformTarget] object that is in the tree.
  const LocalHeroLeader({
    required this.controller,
    super.key,
    super.child,
  });

  final LocalHeroController controller;

  @override
  LocalHeroLeaderElement createElement() => LocalHeroLeaderElement(this);

  @override
  RenderLocalHeroLeaderLayer createRenderObject(BuildContext context) =>
      RenderLocalHeroLeaderLayer(controller: controller);

  @override
  void updateRenderObject(
    BuildContext context,
    RenderLocalHeroLeaderLayer renderObject,
  ) {
    renderObject.controller = controller;
  }
}

class LocalHeroLeaderElement extends SingleChildRenderObjectElement {
  LocalHeroLeaderElement(LocalHeroLeader super.widget);

  @override
  LocalHeroLeader get widget => super.widget as LocalHeroLeader;

  @override
  void update(SingleChildRenderObjectWidget newWidget) {
    super.update(newWidget);
    widget.controller.markRemount();
  }

  @override
  void mount(Element? parent, Object? newSlot) {
    super.mount(parent, newSlot);
    widget.controller.markRemount();
  }

  @override
  void debugVisitOnstageChildren(ElementVisitor visitor) {
    if (!widget.controller.isAnimating) {
      super.debugVisitOnstageChildren(visitor);
    }
  }
}
