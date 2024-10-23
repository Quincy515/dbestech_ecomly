import 'package:dbestech_ecomly/core/common/entities/user.dart';
import 'package:dbestech_ecomly/core/services/injection_container.dart';
import 'package:dbestech_ecomly/src/auth/data/datasources/auth_remote_data_source.dart';
import 'package:dbestech_ecomly/src/auth/data/repositories/auth_repository_implementation.dart';
import 'package:dbestech_ecomly/src/auth/domain/usercases/forgot_password.dart';
import 'package:dbestech_ecomly/src/auth/domain/usercases/login.dart';
import 'package:dbestech_ecomly/src/auth/domain/usercases/register.dart';
import 'package:dbestech_ecomly/src/auth/domain/usercases/reset_password.dart';
import 'package:dbestech_ecomly/src/auth/domain/usercases/verify_otp.dart';
import 'package:dbestech_ecomly/src/auth/domain/usercases/verify_token.dart';
import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_adapter.g.dart';
part 'auth_state.dart';

@riverpod
class AuthAdapter extends _$AuthAdapter {
  @override
  AuthState build() {
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
}
