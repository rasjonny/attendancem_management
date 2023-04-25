
import 'package:attendancem_management/auth/auth_result.dart';

import 'package:attendancem_management/auth/typedefs/employee_id.dart';

class AuthState {
  final AuthResult? result;
  final EmployeeId? employeeId;
  final bool isLoading;

  const AuthState({
    required this.isLoading,
    required this.employeeId,
    required this.result,
  });

  const AuthState.unknown()
      : result = null,
        isLoading = false,
        employeeId = null;
  AuthState copiedWithIsLoading(bool isLoading) =>
      AuthState(isLoading: isLoading, employeeId: employeeId, result: result);

  @override
  bool operator ==(covariant AuthState other) =>
      identical(this, other) ||
      result == other.result &&
          employeeId == other.employeeId &&
          isLoading == other.isLoading;

  @override
  int get hashCode => Object.hash(result, employeeId, isLoading);

  @override
  String toString() =>
      'AuhtState(authState:$result, userId:$employeeId, isLoading:$isLoading)';
}

