import "package:core_module/core/widgets/inputs/custom_text_field.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

class CustomPasswordTextField extends StatefulWidget {
  const CustomPasswordTextField({
    required this.controller,
    super.key,
    this.focusNode,
    this.validator,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final Validator? validator;

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ObjectFlagProperty<Validator?>.has("validator", validator))
      ..add(DiagnosticsProperty<FocusNode?>("focusNode", focusNode))
      ..add(
        DiagnosticsProperty<TextEditingController>("controller", controller),
      );
  }
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) => CustomTextField(
        obscure: _obscureText,
        maxLines: 1,
        titleText: "Password",
        hintText: "Enter your password",
        controller: widget.controller,
        focusNode: widget.focusNode,
        validator: widget.validator,
        textInputType: TextInputType.text,
        autofillHints: const <String>[AutofillHints.password],
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          icon: _obscureText
              ? const Icon(Icons.visibility_off_rounded)
              : const Icon(Icons.visibility_rounded),
        ),
      );
}
