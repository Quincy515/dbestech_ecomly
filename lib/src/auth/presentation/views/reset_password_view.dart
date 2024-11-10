import 'package:dbestech_ecomly/core/common/widgets/app_bar_bottom.dart';
import 'package:dbestech_ecomly/core/extensions/text_extension.dart';
import 'package:dbestech_ecomly/core/res/styles/text.dart';
import 'package:dbestech_ecomly/src/auth/presentation/widgets/reset_password_form.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key, required this.email});

  static const path = '/reset-password';

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Reset Password',
          style: TextStyles.headingSemiBold,
        ),
        bottom: const AppBarBottom(),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        children: <Widget>[
          Text(
            'Change Password',
            style: TextStyles.headingBold3.adaptiveColour(context),
          ),
          Text(
            'Pick a new secure password',
            style: TextStyles.paragraphSubTextRegular1.grey,
          ),
          const Gap(40),
          ResetPasswordForm(email: email),
        ],
      ),
    );
  }
}
