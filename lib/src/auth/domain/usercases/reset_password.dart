import 'package:dbestech_ecomly/core/usecase/usecase.dart';
import 'package:dbestech_ecomly/core/utils/typedefs.dart';
import 'package:dbestech_ecomly/src/auth/domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

class ResetPassword extends UsecaseWithParams<void, ResetPasswordParams> {
  const ResetPassword(this._repo);

  final AuthRepository _repo;

  @override
  ResultFuture<void> call(ResetPasswordParams params) => _repo.resetPassword(
        email: params.email,
        newPassword: params.newPassword,
      );
}

class ResetPasswordParams extends Equatable {
  final String email;
  final String newPassword;

  const ResetPasswordParams({
    required this.email,
    required this.newPassword,
  });

  @override
  List<Object?> get props => [email, newPassword];
}
