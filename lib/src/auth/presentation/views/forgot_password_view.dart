import 'package:dbestech_ecomly/core/common/widgets/app_bar_bottom.dart';
import 'package:dbestech_ecomly/core/extensions/text_extension.dart';
import 'package:dbestech_ecomly/core/res/styles/text.dart';
import 'package:dbestech_ecomly/src/auth/presentation/widgets/forgot_password_form.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  static const path = '/forgot-password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Forgot Password',
          style: TextStyles.headingSemiBold,
        ),
        bottom: const AppBarBottom(),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        children: [
          Text(
            'Confirm Email',
            style: TextStyles.headingBold3.adaptiveColour(context),
          ),
          Text(
            'Enter the email address associated with your account',
            style: TextStyles.paragraphSubTextRegular1.grey,
          ),
          const Gap(40),
          const ForgotPasswordForm(),
        ],
      ),
    );
  }
}
