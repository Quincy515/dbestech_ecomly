part of 'auth_adapter.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

// the initial state
final class AuthInitial extends AuthState {
  const AuthInitial();
}

// the loading state
final class AuthLoading extends AuthState {
  const AuthLoading();
}

// the success state
final class OTPSent extends AuthState {
  const OTPSent();
}

final class LoggedIn extends AuthState {
  const LoggedIn(this.user);

  final User user;

  @override
  List<Object?> get props => [user];
}

final class Registered extends AuthState {
  const Registered();
}

final class PasswordReset extends AuthState {
  const PasswordReset();
}

final class OTPVerified extends AuthState {
  const OTPVerified();
}

final class TokenVerified extends AuthState {
  final bool isValid;

  const TokenVerified(this.isValid);

  @override
  List<Object?> get props => [isValid];
}

// the error state
class AuthError extends AuthState {
  final String message;

  const AuthError(this.message);

  @override
  List<Object?> get props => [message];
}
