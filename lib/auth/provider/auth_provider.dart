import 'package:attendancem_management/auth/auth_state.dart';
import 'package:attendancem_management/auth/notifier/auth_state_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>(
  (ref) => AuthStateNotifier(),
);
