part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class SignInRequested extends AuthEvent {
  final String email;
  final String password;

  const SignInRequested(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

class SignOutRequested extends AuthEvent {}

class AuthPasswordResetRequested extends AuthEvent {
  final String email;

  const AuthPasswordResetRequested(this.email);

  @override
  List<Object?> get props => [email];
}

class AuthPasswordChanged extends AuthEvent {
  final String password;

  const AuthPasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

class AuthEmailChanged extends AuthEvent {
  final String email;

  const AuthEmailChanged(this.email);

  @override
  List<Object?> get props => [email];
}

class AuthSubmitted extends AuthEvent {}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  const LoginRequested(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

class LogoutRequested extends AuthEvent {}

class AccountRequest extends AuthEvent {
  final String username;
  final String email;
  final String password;

  const AccountRequest({
    required this.username,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [username, email, password];
}
