import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:wm_flutter/core/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(const AuthState()) {
    // Initialize event handlers here
    on<AuthEmailChanged>(_onEmailChanged);
    on<AuthPasswordChanged>(_onPasswordChanged);
    on<AuthSubmitted>(_onSubmitted);
    on<LoginRequested>(onLogin);
    on<AccountRequest>(onAccountRequest);
  }

  Future<void> onAccountRequest(
    AccountRequest event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      final result = await authRepository.registerUser(
        event.email,
        event.password,
        event.username,
      );
      emit(AuthenticatedSuccess(result));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  void _onEmailChanged(AuthEmailChanged event, Emitter<AuthState> emit) {
    String error = '';
    if (event.email.isEmpty) {
      error = 'Email is required';
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(event.email)) {
      error = 'Invalid email format';
    } else if (event.email.length > 255) {
      error = 'Email must be less than 255 characters';
    } else if (!event.email.contains('@')) {
      error = 'Enter a valid email address';
    }

    final newState = state.copyWith(email: event.email, emailError: error);

    _validateForm(newState, emit);
  }

  void _onPasswordChanged(AuthPasswordChanged event, Emitter<AuthState> emit) {
    String error = '';
    if (event.password.isEmpty) {
      error = 'Password is required';
    } else if (event.password.length < 6) {
      error = 'Password must be at least 6 characters';
    } else if (event.password.length > 128) {
      error = 'Password must be less than 128 characters';
    }

    final newState = state.copyWith(
      password: event.password,
      passwordError: error,
    );

    _validateForm(newState, emit);
  }

  void _onSubmitted(AuthSubmitted event, Emitter<AuthState> emit) {
    if (!state.isFormValid) return;

    emit(state.copyWith(isSubmitting: true));

    try {
      // Simulate authentication process
      Future.delayed(const Duration(seconds: 2), () {
        emit(state.copyWith(isSubmitting: false, isSuccess: true));
      });

      //simulate success
      emit(state.copyWith(isSubmitting: false, isSuccess: true));
    } catch (e) {
      // Handle authentication failure
      emit(state.copyWith(isSubmitting: false));
    }
  }

  void _validateForm(AuthState currentState, Emitter<AuthState> emit) {
    final bool isValid =
        currentState.emailError.isEmpty &&
        currentState.passwordError.isEmpty &&
        currentState.email.isNotEmpty &&
        currentState.password.isNotEmpty;
    emit(currentState.copyWith(isFormValid: isValid));
  }

  void onLogin(LoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final success = await authRepository.login(event.email, event.password);
      if (success) {
        emit(Authenticated());
      } else {
        emit(AuthError('Invalid Email or password'));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> onLogout(LogoutRequested event, Emitter<AuthState> emit) async {
    await authRepository.signOut();
    emit(Unauthenticated());
  }
}
