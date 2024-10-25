import 'package:dbestech_ecomly/core/common/widgets/ecomly.dart';
import 'package:dbestech_ecomly/core/extensions/text_extension.dart';
import 'package:dbestech_ecomly/core/res/styles/text.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    this.onPressed,
    required this.text,
    this.height,
    this.padding,
    this.textStyle,
    this.backgroundColor,
  });

  final VoidCallback? onPressed;
  final String text;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height ?? 66,
        width: double.maxFinite,
        child: FilledButton(
          style: FilledButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          onPressed: () {
            // Unfocus the current focused widget to prevent keyboard from disappearing
            // 点击按钮时，关闭键盘
            FocusManager.instance.primaryFocus?.unfocus();
            onPressed?.call();
          },
          child: Text(
            text,
            style: textStyle ?? TextStyles.buttonTextHeadingSemiBold.white,
          ),
        ));
  }
}
