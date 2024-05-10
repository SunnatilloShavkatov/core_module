import "package:core_module/core/extension/extension.dart";
import "package:core_module/core/utils/utils.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";

typedef Validator = String? Function(String?);
typedef OnChanged = void Function(String);
typedef OnFieldSubmitted = void Function(String);

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    this.hintText,
    this.focusNode,
    this.onChanged,
    this.controller,
    super.key,
    this.validator,
    this.textInputType = TextInputType.name,
    this.textCapitalization = TextCapitalization.none,
    this.cursorColor,
    this.enabled = true,
    this.obscure = false,
    this.textInputFormatter,
    this.textInputAction = TextInputAction.done,
    this.nextFocus,
    this.errorText,
    this.suffix,
    this.suffixIcon,
    this.prefix,
    this.prefixIcon,
    this.prefixTextStyle,
    this.suffixTextStyle,
    this.prefixText,
    this.suffixText,
    this.labelTextStyle,
    this.labelText,
    this.contentPadding,
    this.cursorHeight,
    this.onFieldSubmitted,
    this.titleText,
    this.maxLines,
    this.autofillHints,
  });

  final TextEditingController? controller;
  final Validator? validator;
  final OnChanged? onChanged;
  final TextInputType textInputType;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextCapitalization textCapitalization;
  final Color? cursorColor;
  final bool enabled;
  final bool obscure;
  final TextInputFormatter? textInputFormatter;
  final TextInputAction textInputAction;
  final String? hintText;
  final String? errorText;
  final Widget? suffix;
  final Widget? suffixIcon;
  final Widget? prefix;
  final Widget? prefixIcon;
  final TextStyle? prefixTextStyle;
  final TextStyle? suffixTextStyle;
  final TextStyle? labelTextStyle;
  final String? labelText;
  final String? titleText;
  final String? prefixText;
  final String? suffixText;
  final EdgeInsetsGeometry? contentPadding;
  final double? cursorHeight;
  final int? maxLines;
  final OnFieldSubmitted? onFieldSubmitted;
  final Iterable<String>? autofillHints;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (titleText != null)
            Text(
              titleText ?? "",
              style: context.textTheme.headlineSmall,
            ),
          if (titleText != null) AppUtils.kGap8,
          TextFormField(
            key: key,
            style: context.textStyle.regularBody,
            autofillHints: autofillHints,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller,
            validator: validator,
            onChanged: onChanged,
            keyboardType: textInputType,
            focusNode: focusNode,
            textCapitalization: textCapitalization,
            cursorColor: cursorColor ?? context.colorScheme.primary,
            enableInteractiveSelection: true,
            obscureText: obscure,
            enabled: enabled,
            textInputAction: textInputAction,
            onEditingComplete: () {
              if (nextFocus != null) {
                nextFocus?.requestFocus();
              } else {
                focusNode?.unfocus();
              }
            },
            onFieldSubmitted: (String value) {
              if (onFieldSubmitted != null) {
                onFieldSubmitted?.call(value);
              }
              if (nextFocus != null) {
                nextFocus?.requestFocus();
              } else {
                focusNode?.unfocus();
              }
            },
            inputFormatters: textInputFormatter != null
                ? <TextInputFormatter>[textInputFormatter!]
                : null,
            maxLines: maxLines,
            decoration: InputDecoration(
              fillColor: context.colorScheme.surface,
              labelText: labelText,
              labelStyle: labelTextStyle,
              hintText: hintText,
              hintStyle: context.textStyle.hintStyle,
              errorText: errorText,
              contentPadding: contentPadding,
              suffix: suffix,
              suffixIcon: suffixIcon,
              prefix: prefix,
              prefixIcon: prefixIcon,
              prefixText: prefixText,
              prefixStyle: prefixTextStyle,
              suffixText: suffixText,
              suffixStyle: suffixTextStyle,
            ),
            cursorHeight: cursorHeight,
          ),
        ],
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty<TextEditingController>("controller", controller),
      )
      ..add(
        DiagnosticsProperty<EdgeInsetsGeometry?>(
          "contentPadding",
          contentPadding,
        ),
      )
      ..add(ObjectFlagProperty<Validator?>.has("validator", validator))
      ..add(ObjectFlagProperty<OnChanged>.has("onChanged", onChanged))
      ..add(DiagnosticsProperty<TextInputType>("textInputType", textInputType))
      ..add(DiagnosticsProperty<FocusNode>("focusNode", focusNode))
      ..add(DiagnosticsProperty<FocusNode?>("nextFocusNode", nextFocus))
      ..add(
        EnumProperty<TextCapitalization>(
          "textCapitalization",
          textCapitalization,
        ),
      )
      ..add(ColorProperty("cursorColor", cursorColor))
      ..add(DiagnosticsProperty<bool>("enabled", enabled))
      ..add(DiagnosticsProperty<bool>("obscure", obscure))
      ..add(
        DiagnosticsProperty<TextInputFormatter?>(
          "textInputFormatter",
          textInputFormatter,
        ),
      )
      ..add(EnumProperty<TextInputAction>("textInputAction", textInputAction))
      ..add(StringProperty("hintText", hintText))
      ..add(StringProperty("errorText", errorText))
      ..add(DiagnosticsProperty<TextStyle?>("prefixTextStyle", prefixTextStyle))
      ..add(DiagnosticsProperty<TextStyle?>("suffixTextStyle", suffixTextStyle))
      ..add(DiagnosticsProperty<TextStyle?>("labelTextStyle", labelTextStyle))
      ..add(StringProperty("labelText", labelText))
      ..add(StringProperty("prefixText", prefixText))
      ..add(StringProperty("suffixText", suffixText))
      ..add(DoubleProperty("cursorHeight", cursorHeight))
      ..add(
        ObjectFlagProperty<OnFieldSubmitted?>.has(
          "onFieldSubmitted",
          onFieldSubmitted,
        ),
      )
      ..add(StringProperty("titleText", titleText))
      ..add(IntProperty("maxLines", maxLines));
  }
}
