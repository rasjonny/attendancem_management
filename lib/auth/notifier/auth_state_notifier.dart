import 'package:attendancem_management/auth/auth_result.dart';
import 'package:attendancem_management/auth/auth_state.dart';
import 'package:attendancem_management/auth/authenticator.dart';
import 'package:flutter/material.dart' show BuildContext;
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  final _authenticator = const Authenticator();

  AuthStateNotifier() : super(const AuthState.unknown()) {
    if (_authenticator.isAlreadyLoggedIn) {
      state = AuthState(
        isLoading: false,
        employeeId: _authenticator.employeeId,
        result: AuthResult.success,
      );
    }
  }
  Future<void> logOut(BuildContext context) async {
    state.copiedWithIsLoading(true);
    await _authenticator.logOut(context);

    state = const AuthState.unknown();
  }

  Future<AuthResult> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    state.copiedWithIsLoading(true);
    final result =
        await _authenticator.signInWithEmail(email: email, password: password);
    final employeeId = _authenticator.employeeId;

    state = AuthState(
      isLoading: false,
      employeeId: employeeId,
      result: result,
    );
    return state.result ?? AuthResult.failure;
  }
}
