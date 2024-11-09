import 'package:dbestech_ecomly/core/common/widgets/app_bar_bottom.dart';
import 'package:dbestech_ecomly/core/common/widgets/rounded_button.dart';
import 'package:dbestech_ecomly/core/extensions/string_extension.dart';
import 'package:dbestech_ecomly/core/extensions/text_extension.dart';
import 'package:dbestech_ecomly/core/extensions/widget_extension.dart';
import 'package:dbestech_ecomly/core/res/styles/text.dart';
import 'package:dbestech_ecomly/core/utils/core_utils.dart';
import 'package:dbestech_ecomly/src/auth/presentation/app/adapter/auth_adapter.dart';
import 'package:dbestech_ecomly/src/auth/presentation/views/reset_password_view.dart';
import 'package:dbestech_ecomly/src/auth/presentation/widgets/otp_fields.dart';
import 'package:dbestech_ecomly/src/auth/presentation/widgets/otp_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class VerifyOtpView extends ConsumerStatefulWidget {
  const VerifyOtpView({super.key, required this.email});

  static const path = '/verify-otp';

  final String email;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VerifyOtpViewState();
}

class _VerifyOtpViewState extends ConsumerState<VerifyOtpView> {
  final otpController = TextEditingController();
  final familyKey = GlobalKey();

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authAdapterProvider(familyKey));
    ref.listen(authAdapterProvider(), (previous, next) {
      if (next is AuthError) {
        CoreUtils.showSnackBar(context, message: next.message);
      } else if (next is OTPVerified) {
        // CoreUtils.postFrameCall(
        // () => context.pushReplacement(
        // ResetPasswordView.path,
        // extra: widget.email,
        // ),
        // );
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Verify OTP',
          style: TextStyles.headingSemiBold,
        ),
        bottom: const AppBarBottom(),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        children: <Widget>[
          Text(
            'Verification Code',
            style: TextStyles.headingBold3.adaptiveColour(context),
          ),
          Text(
            'Code has been sent to ${widget.email.obscureEmail}',
            style: TextStyles.paragraphSubTextRegular1.grey,
          ),
          const Gap(20),
          OtpFields(controller: otpController),
          const Gap(30),
          OtpTimer(email: widget.email, familyKey: familyKey),
          const Gap(40),
          RoundedButton(
            onPressed: () async {
              if (otpController.text.length < 4) {
                CoreUtils.showSnackBar(context, message: 'Invalid OTP');
              } else {
                final router = GoRouter.of(context);
                await ref
                    .read(authAdapterProvider(familyKey).notifier)
                    .verifyOTP(
                      email: widget.email,
                      otp: otpController.text,
                    );
                router.pushReplacement(ResetPasswordView.path,
                    extra: widget.email);
              }
            },
            text: 'Verify',
          ).loading(auth is AuthLoading),
        ],
      ),
    );
  }
}
