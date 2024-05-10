import "package:core_module/core/extension/extension.dart";
import "package:core_module/core/utils/utils.dart";
import "package:flutter/material.dart";

void showErrorSnackBar(
  BuildContext context, {
  required String message,
}) {
  final double height = context.viewPadding.top + context.viewPadding.bottom;
  context.showSnackBar(
    SnackBar(
      backgroundColor: context.colorScheme.error,
      margin: EdgeInsets.only(
        bottom: context.height - height - kToolbarHeight - 24,
        left: 16,
        right: 16,
      ),
      clipBehavior: Clip.antiAlias,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            context.tr("error"),
            style: context.textTheme.labelSmall?.copyWith(
              color: context.colorScheme.onError,
            ),
          ),
          AppUtils.kGap4,
          Text(
            message,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
  );
}
