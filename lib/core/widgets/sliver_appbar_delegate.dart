import "dart:math";

import "package:core_module/core/extension/extension.dart";
import "package:flutter/material.dart";

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate({
    required this.minHeight,
    required this.child,
    this.maxHeight,
    this.color,
  });

  final double minHeight;
  final double? maxHeight;
  final Widget child;
  final Color? color;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight ?? minHeight, minHeight);

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) =>
      ColoredBox(
        color: color ?? context.colorScheme.surface,
        child: SizedBox.expand(child: child),
      );

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) =>
      maxHeight != oldDelegate.maxHeight ||
      minHeight != oldDelegate.minHeight ||
      child != oldDelegate.child;
}
