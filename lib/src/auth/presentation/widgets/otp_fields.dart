import 'package:dbestech_ecomly/core/extensions/context_extension.dart';
import 'package:dbestech_ecomly/core/res/styles/colours.dart';
import 'package:dbestech_ecomly/core/res/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpFields extends StatelessWidget {
  const OtpFields({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 4,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      autoFocus: true,
      dialogConfig: DialogConfig(
        dialogContent: 'Do you want to paste ',
        dialogTitle: 'Paste OTP',
      ),
      textStyle: TextStyles.headingMedium1.copyWith(
        fontWeight: FontWeight.bold,
        color: Colours.classicAdaptiveTextColour(context),
      ),
      pinTheme: PinTheme(
        inactiveColor: const Color(0xFFEEEEEE),
        selectedColor: context.theme.primaryColor,
        activeColor: context.theme.primaryColor,
        shape: PinCodeFieldShape.box,
        borderWidth: 1,
        borderRadius: BorderRadius.circular(12),
        fieldHeight: 59,
        fieldWidth: 86,
        activeFillColor: const Color(0xFFFAFBFA),
        inactiveFillColor: const Color(0xFFFAFBFA),
      ),
      onChanged: (_) {},
      onCompleted: (pin) {
        controller.text = pin;
      },
      beforeTextPaste: (val) {
        return val != null &&
            val.isNotEmpty &&
            val.length == 4 &&
            int.tryParse(val) != null;
      },
    );
  }
}
