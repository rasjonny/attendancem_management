import 'package:attendancem_management/auth/auth_result.dart';
import 'dart:developer' as devtools show log;

import 'package:attendancem_management/auth/typedefs/employee_id.dart';
import 'package:attendancem_management/dialogue/alert_dialogue.dart';
import 'package:attendancem_management/dialogue/logout_dialogue.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ui/login_view.dart';

extension Log on Object {
  void log() => devtools.log(toString());
}

class Authenticator {
  const Authenticator();
  // EmployeeId comes from the backend
  EmployeeId? get employeeId => null;
  bool get isAlreadyLoggedIn => employeeId != null;

  Future<void> logOut(BuildContext context) async {
    final isLogout = await LogoutDialogue()
                      .present(context)
                      .then((value) => value ?? false);
                  if (isLogout) {
                     SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setString('token', '');
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LoginView(),
                      ),
                    );
                  } else {
                    Navigator.of(context).pop();
                  }
  }

  Future<AuthResult> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      return AuthResult.success;
    } catch (e) {
      return AuthResult.failure;
    }
  }
}
