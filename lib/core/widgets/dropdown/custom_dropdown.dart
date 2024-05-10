import "package:dropdown_button2/dropdown_button2.dart";
import "package:core_module/core/extension/extension.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

class CustomDropDown<T> extends StatelessWidget {
  const CustomDropDown({
    super.key,
    this.value,
    this.items,
    this.onChanged,
    this.label,
    this.hintText,
    this.currentFocus,
    this.nextFocus,
    this.fillColor,
  });

  final T? value;
  final String? label;
  final String? hintText;
  final List<DropdownMenuItem<T>>? items;
  final ValueChanged<T?>? onChanged;
  final FocusNode? currentFocus;
  final FocusNode? nextFocus;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              "$label",
              style: context.textTheme.headlineSmall,
            ),
          ),
        DropdownButtonHideUnderline(
          child: DropdownButton2<T>(
            isExpanded: true,
            hint: Text(
              hintText ?? "",
              style: context.textStyle.hintStyle,
            ),
            focusNode: currentFocus,
            onMenuStateChange: (bool isMenuOpen) {
              if (isMenuOpen) {
                currentFocus?.unfocus();
                nextFocus?.requestFocus();
              }
            },
            items: items,
            value: value,
            onChanged: onChanged,
            buttonStyleData: ButtonStyleData(
              elevation: 0,
              padding: const EdgeInsets.fromLTRB(0, 2, 12, 2),
              decoration: BoxDecoration(
                color: fillColor,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                border: Border.fromBorderSide(
                  theme.inputDecorationTheme.enabledBorder!.borderSide,
                ),
              ),
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 300,
              padding: EdgeInsets.zero,
              scrollPadding: EdgeInsets.zero,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                color: context.colorScheme.surface,
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            ),
            iconStyleData: const IconStyleData(
              icon: Icon(Icons.keyboard_arrow_down_rounded),
              openMenuIcon: Icon(Icons.keyboard_arrow_up_rounded),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<T?>("value", value))
      ..add(StringProperty("label", label))
      ..add(StringProperty("hintText", hintText))
      ..add(ObjectFlagProperty<ValueChanged<T?>?>.has("onChanged", onChanged))
      ..add(DiagnosticsProperty<FocusNode?>("currentFocus", currentFocus))
      ..add(DiagnosticsProperty<FocusNode?>("nextFocus", nextFocus))
      ..add(ColorProperty("fillColor", fillColor));
  }
}
