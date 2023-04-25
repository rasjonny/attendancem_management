import 'package:attendancem_management/auth/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

AppBar appBarWidget(BuildContext context, String title) {
  return AppBar(
    elevation: 0,
    title: Center(child: Text(title)),
    actions: [
      PopupMenuButton(
        itemBuilder: ((context) {
          return [
            PopupMenuItem(
              child: Consumer(
                builder: (((context, ref, child) {
                  return TextButton(
                    onPressed: () async {
                      final auth = ref.read(authStateProvider.notifier);
                      auth.logOut(context);
                      //     final isLogout = await LogoutDialogue()
                      //         .present(context)
                      //         .then((value) => value ?? false);
                      //     if (isLogout) {
                      //        SharedPreferences prefs = await SharedPreferences.getInstance();
                      // await prefs.setString('token', '');
                      //       Navigator.of(context).push(
                      //         MaterialPageRoute(
                      //           builder: (context) => const LoginView(),
                      //         ),
                      //       );
                      //     } else {
                      //       Navigator.of(context).pop();
                      //     }
                    },
                    child: const Text('Logout'),
                  );
                })),
              ),
            )
          ];
        }),
      )
    ],
  );
}
