import 'package:dbestech_ecomly/core/common/widgets/rounded_button.dart';
import 'package:dbestech_ecomly/core/common/widgets/vertical_label_field.dart';
import 'package:dbestech_ecomly/core/extensions/widget_extension.dart';
import 'package:dbestech_ecomly/core/utils/core_utils.dart';
import 'package:dbestech_ecomly/src/auth/presentation/app/adapter/auth_adapter.dart';
import 'package:dbestech_ecomly/src/auth/presentation/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordForm extends ConsumerStatefulWidget {
  const ResetPasswordForm({super.key, required this.email});

  final String email;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ResetPasswordFormState();
}

class _ResetPasswordFormState extends ConsumerState<ResetPasswordForm> {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final obscurePasswordNotifier = ValueNotifier(true);
  final obscureConfirmPasswordNotifier = ValueNotifier(true);

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    obscurePasswordNotifier.dispose();
    obscureConfirmPasswordNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authAdapterProvider());
    ref.listen(authAdapterProvider(), (previous, next) {
      if (next is AuthError) {
        CoreUtils.showSnackBar(context, message: next.message);
      } else if (next is PasswordReset) {
        CoreUtils.postFrameCall(
          () => context.go(Uri(path: LoginView.path).toString()),
        );
      }
    });
    return Form(
      key: formKey,
      child: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: obscurePasswordNotifier,
            builder: (_, value, __) {
              return VerticalLabelField(
                label: 'Password',
                hintText: 'Enter your password',
                controller: passwordController,
                obscureText: value,
                keyboardType: TextInputType.visiblePassword,
                suffixIcon: GestureDetector(
                  onTap: () {
                    obscurePasswordNotifier.value =
                        !obscurePasswordNotifier.value;
                  },
                  child: Icon(
                    value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                ),
              );
            },
          ),
          const Gap(20),
          ValueListenableBuilder(
            valueListenable: obscureConfirmPasswordNotifier,
            builder: (_, value, __) {
              return VerticalLabelField(
                label: 'Confirm Password',
                hintText: 'Re-enter your password',
                controller: confirmPasswordController,
                obscureText: value,
                keyboardType: TextInputType.visiblePassword,
                suffixIcon: GestureDetector(
                  onTap: () {
                    obscureConfirmPasswordNotifier.value =
                        !obscureConfirmPasswordNotifier.value;
                  },
                  child: Icon(
                    value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                ),
                validator: (value) {
                  if (value != passwordController.text.trim()) {
                    return 'Password does not match';
                  }
                  return null;
                },
              );
            },
          ),
          const Gap(40),
          RoundedButton(
              text: 'Submit',
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  final password = passwordController.text.trim();
                  await ref.read(authAdapterProvider().notifier).resetPassword(
                        email: widget.email,
                        newPassword: password,
                      );
                }
              }).loading(auth is AuthLoading),
        ],
      ),
    );
  }
}
