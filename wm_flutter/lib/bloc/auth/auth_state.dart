part of 'auth_bloc.dart';

@immutable
class AuthState extends Equatable {
  final String email;
  final String password;
  final String emailError;
  final String passwordError;
  final bool isFormValid;
  final bool isSubmitting;
  final bool isSuccess;

  const AuthState({
    this.email = '',
    this.password = '',
    this.emailError = '',
    this.passwordError = '',
    this.isFormValid = false,
    this.isSubmitting = false,
    this.isSuccess = false,
  });

  AuthState copyWith({
    String? email,
    String? password,
    String? emailError,
    String? passwordError,
    bool? isFormValid,
    bool? isSubmitting,
    bool? isSuccess,
  }) {
    return AuthState(
      email: email ?? this.email,
      password: password ?? this.password,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      isFormValid: isFormValid ?? this.isFormValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }

  @override
  List<Object?> get props => [
    email,
    password,
    emailError,
    passwordError,
    isFormValid,
    isSubmitting,
    isSuccess,
  ];
}

final class AuthInitial extends AuthState {}

// final class Authenticated extends AuthState {
//   final User user;

//   Authenticated(this.user);
// }

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {}

class AuthenticatedSuccess extends AuthState {
  final bool success;

  const AuthenticatedSuccess(this.success);
}

class AuthError extends AuthState {
  final String errorMessage;

  const AuthError(this.errorMessage);
}

class Unauthenticated extends AuthState {}
