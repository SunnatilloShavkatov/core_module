import "package:core_module/core/extension/extension.dart";
import "package:core_module/core/widgets/bottom_sheet/custom_bottom_sheet.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:gap/gap.dart";
import "package:url_launcher/url_launcher.dart";

class AppUpdateBottomSheetWidget extends StatelessWidget {
  const AppUpdateBottomSheetWidget({
    required this.isForceUpdate,
    super.key,
    this.onTap,
  });

  final void Function()? onTap;
  final bool isForceUpdate;

  @override
  Widget build(BuildContext context) => PopScope(
        canPop: false,
        child: SafeArea(
          minimum: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                context.tr("new_version"),
                style: context.textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const Gap(8),
              Text(
                context.tr(
                  "update_app",
                  namedArgs: <String, String>{"appName": "Englify"},
                ),
                style: context.textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const Gap(16),
              ElevatedButton(
                onPressed: onTap,
                child: Text(context.tr("update")),
              ),
              if (!isForceUpdate) ...<Widget>[
                const Gap(8),
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(context.tr("later")),
                ),
              ],
            ],
          ),
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ObjectFlagProperty<void Function()?>.has("onTap", onTap))
      ..add(DiagnosticsProperty<bool>("isForceUpdate", isForceUpdate));
  }
}

Future<void> appUpdateBottomSheet({
  required BuildContext context,
  required bool isForceUpdate,
  required String shareAppUrl,
  void Function()? nextToNavigation,
}) async {
  await customModalBottomSheet<bool>(
    context: context,
    enableDrag: !isForceUpdate,
    isDismissible: !isForceUpdate,
    builder: (_, ScrollController? controller) => AppUpdateBottomSheetWidget(
      isForceUpdate: isForceUpdate,
      onTap: () async {
        await _onUpdateApp(shareAppUrl).then(
          (bool value) async {
            if (!context.mounted) {
              return;
            }
            nextToNavigation?.call();
          },
        );
      },
    ),
  );
}

Future<bool> _onUpdateApp(String shareAppUrl) async {
  final Uri url = Uri.parse(shareAppUrl);
  return launchUrl(url, mode: LaunchMode.externalApplication);
}
