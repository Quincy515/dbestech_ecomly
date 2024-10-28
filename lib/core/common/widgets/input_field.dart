import 'package:dbestech_ecomly/core/extensions/context_extension.dart';
import 'package:dbestech_ecomly/core/extensions/text_extension.dart';
import 'package:dbestech_ecomly/core/res/styles/colours.dart';
import 'package:dbestech_ecomly/core/res/styles/text.dart';
import 'package:dbestech_ecomly/core/utils/core_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {
  const InputField({
    required this.controller,
    super.key,
    this.suffixIcon,
    this.hintText,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.defaultValidation = true,
    this.inputFormatters,
    this.prefix,
    this.enabled = true,
    this.readOnly = false,
    this.contentPadding,
    this.prefixIcon,
    this.focusNode,
    this.onTap,
    this.expandable = false,
  });

  final Widget? suffixIcon;
  final String? hintText;
  final String? Function(String? value)? validator;
  final TextEditingController controller;

  final TextInputType? keyboardType;
  final bool obscureText;
  final bool defaultValidation;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefix;
  final bool enabled;
  final bool readOnly;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final VoidCallback? onTap;
  final bool expandable;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      focusNode: focusNode,
      obscureText: obscureText,
      enabled: enabled,
      readOnly: readOnly,
      maxLines: expandable ? 5 : 1,
      minLines: expandable ? 1 : null,
      style: TextStyles.paragraphSubTextRegular3.adaptiveColour(context),
      onTap: onTap,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: context.theme.primaryColor),
        ),
        hintText: hintText,
        suffixIcon: suffixIcon,
        hintStyle: TextStyles.paragraphSubTextRegular3.grey,
        suffixIconColor: Colours.lightThemeSecondaryTextColour,
        prefix: prefix,
        prefixIcon: prefixIcon,
        contentPadding:
            contentPadding ?? const EdgeInsets.symmetric(horizontal: 16),
        filled: true,
        fillColor: CoreUtils.adaptiveColour(
          context,
          lightModeColour: Colours.lightThemeStockColour,
          darkModeColour: Colours.darkThemeDarkSharpColour,
        ),
      ),
      inputFormatters: inputFormatters,
      validator: defaultValidation
          ? (value) {
              if (value == null || value.isEmpty) return 'Required Field';
              return validator?.call(value);
            }
          : validator,
    );
  }
}
