import 'package:dbestech_ecomly/core/common/widgets/rounded_button.dart';
import 'package:dbestech_ecomly/core/common/widgets/vertical_label_field.dart';
import 'package:dbestech_ecomly/core/extensions/widget_extension.dart';
import 'package:dbestech_ecomly/core/res/styles/text.dart';
import 'package:dbestech_ecomly/core/services/router.dart';
import 'package:dbestech_ecomly/core/utils/core_utils.dart';
import 'package:dbestech_ecomly/src/auth/presentation/app/adapter/auth_adapter.dart';
import 'package:dbestech_ecomly/src/auth/presentation/views/verify_otp_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordForm extends ConsumerStatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends ConsumerState<ForgotPasswordForm> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authAdapterProvider());
    debugPrint(router.routerDelegate.currentConfiguration.toString());
    ref.listen(authAdapterProvider(), (previous, next) {
      if (next is AuthError) {
        CoreUtils.showSnackBar(context, message: next.message);
      } else if (next is OTPSent) {
        context.push(
          VerifyOtpView.path,
          extra: emailController.text.trim(),
        );
      }
    });
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          if (auth case AuthError(:final message))
            Container(
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                message,
                style: TextStyles.paragraphRegular.apply(
                  color: Colors.red,
                ),
              ),
            ),
          VerticalLabelField(
            label: 'Email',
            hintText: 'Enter your email',
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
          ),
          const Gap(40),
          RoundedButton(
            text: 'Continue',
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                await ref
                    .read(authAdapterProvider().notifier)
                    .forgetPassword(email: emailController.text.trim());
              }
            },
          ).loading(auth is AuthLoading),
        ],
      ),
    );
  }
}
