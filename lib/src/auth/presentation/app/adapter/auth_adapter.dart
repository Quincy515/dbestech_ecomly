import 'package:dbestech_ecomly/core/common/app/riverpod/current_user_provider.dart';
import 'package:dbestech_ecomly/core/common/entities/user.dart';
import 'package:dbestech_ecomly/core/services/injection_container.dart';
import 'package:dbestech_ecomly/src/auth/domain/usercases/forgot_password.dart';
import 'package:dbestech_ecomly/src/auth/domain/usercases/login.dart';
import 'package:dbestech_ecomly/src/auth/domain/usercases/register.dart';
import 'package:dbestech_ecomly/src/auth/domain/usercases/reset_password.dart';
import 'package:dbestech_ecomly/src/auth/domain/usercases/verify_otp.dart';
import 'package:dbestech_ecomly/src/auth/domain/usercases/verify_token.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_adapter.g.dart';
part 'auth_state.dart';

@riverpod
class AuthAdapter extends _$AuthAdapter {
  @override
  AuthState build([GlobalKey? familykey]) {
    _forgotPassword = sl<ForgotPassword>();
    _login = sl<Login>();
    _register = sl<Register>();
    _resetPassword = sl<ResetPassword>();
    _verifyOTP = sl<VerifyOTP>();
    _verifyToken = sl<VerifyToken>();
    return const AuthInitial();
  }

  late ForgotPassword _forgotPassword;
  late Login _login;
  late Register _register;
  late ResetPassword _resetPassword;
  late VerifyOTP _verifyOTP;
  late VerifyToken _verifyToken;

  Future<void> login({required String email, required String password}) async {
    state = const AuthLoading();
    final result = await _login(LoginParams(email: email, password: password));
    result.fold(
      (failure) => state = AuthError(failure.errorMessage),
      (user) {
        ref.read(currentUserProvider.notifier).setUser(user);
        state = LoggedIn(user);
      },
    );
  }

  Future<void> register({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    state = const AuthLoading();
    final result = await _register(
      RegisterParams(
        email: email,
        password: password,
        name: name,
        phone: phone,
      ),
    );
    result.fold(
      (failure) => state = AuthError(failure.errorMessage),
      (_) => state = const Registered(),
    );
  }

  Future<void> forgetPassword({required String email}) async {
    state = const AuthLoading();
    final result = await _forgotPassword(email);
    result.fold(
      (failure) => state = AuthError(failure.errorMessage),
      (_) => state = const OTPSent(),
    );
  }

  Future<void> verifyOTP({required String email, required String otp}) async {
    state = const AuthLoading();
    final result = await _verifyOTP(VerifyOTPParams(email: email, otp: otp));
    result.fold(
      (failure) => state = AuthError(failure.errorMessage),
      (_) => state = const OTPVerified(),
    );
  }

  Future<void> resetPassword({
    required String email,
    required String newPassword,
  }) async {
    state = const AuthLoading();
    final result = await _resetPassword(
      ResetPasswordParams(email: email, newPassword: newPassword),
    );
    result.fold(
      (failure) => state = AuthError(failure.errorMessage),
      (_) => state = const PasswordReset(),
    );
  }

  Future<void> verifyToken() async {
    state = const AuthLoading();
    final result = await _verifyToken();
    result.fold(
      (failure) => state = AuthError(failure.errorMessage),
      (isValid) {
        state = TokenVerified(isValid);
        if (!isValid) ref.read(currentUserProvider.notifier).setUser(null);
      },
    );
  }
}
