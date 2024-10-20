import 'package:dbestech_ecomly/core/common/entities/user.dart';
import 'package:dbestech_ecomly/core/usecase/usecase.dart';
import 'package:dbestech_ecomly/core/utils/typedefs.dart';
import 'package:dbestech_ecomly/src/auth/domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

class Register extends UsecaseWithParams<void, RegisterParams> {
  const Register(this._repo);

  final AuthRepository _repo;

  @override
  ResultFuture<void> call(RegisterParams params) => _repo.register(
        email: params.email,
        password: params.password,
        name: params.name,
        phone: params.phone,
      );
}

class RegisterParams extends Equatable {
  const RegisterParams({
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
  });

  const RegisterParams.empty()
      : email = '',
        password = '',
        name = '',
        phone = '';

  final String email;
  final String password;
  final String name;
  final String phone;

  @override
  List<Object?> get props => [email, password, name, phone];
}
