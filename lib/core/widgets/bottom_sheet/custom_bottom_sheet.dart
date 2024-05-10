import "package:core_module/core/extension/extension.dart";
import "package:flutter/material.dart";

typedef WidgetScrollBuilder = Widget Function(
  BuildContext context,
  ScrollController? controller,
);

Future<T?> customModalBottomSheet<T>({
  required BuildContext context,
  required WidgetScrollBuilder builder,
  bool isScrollControlled = false,
  bool isDismissible = true,
  bool enableDrag = true,
}) async =>
    showModalBottomSheet(
      context: context,
      enableDrag: enableDrag,
      isDismissible: isDismissible,
      isScrollControlled: true,
      clipBehavior: Clip.antiAlias,
      constraints: BoxConstraints(
        maxHeight: context.kSize.height * 0.9,
        minHeight: context.kSize.height * 0.1,
      ),
      builder: (_) {
        if (isScrollControlled) {
          return DraggableScrollableSheet(
            snap: true,
            expand: false,
            minChildSize: 0.5,
            initialChildSize: 1,
            builder: (BuildContext context, ScrollController controller) =>
                builder(context, controller),
          );
        } else {
          return builder(context, null);
        }
      },
    );
