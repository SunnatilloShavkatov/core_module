import "package:core_module/core/extension/extension.dart";
import "package:flutter/cupertino.dart";
import "package:image_picker/image_picker.dart";

class ChooseImageSheet extends StatelessWidget {
  const ChooseImageSheet({required this.onTap, super.key});

  final void Function(ImageSource) onTap;

  @override
  Widget build(BuildContext context) => CupertinoActionSheet(
        title: Text(context.tr("choose_image")),
        actions: <Widget>[
          CupertinoActionSheetAction(
            onPressed: () => onTap(ImageSource.gallery),
            child: Text(context.tr("select_from_photos")),
          ),
          CupertinoActionSheetAction(
            onPressed: () => onTap(ImageSource.camera),
            child: Text(context.tr("to_photograph")),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: Text(context.tr("cancel")),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      );
}
