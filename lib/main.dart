import 'package:attendancem_management/auth/provider/is_logged_in_provider.dart';
import 'package:attendancem_management/ui/login_view.dart';
import 'package:attendancem_management/ui/project_selection_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: Consumer(
          builder: (context, ref, child) {
            final isLoggedIn = ref.watch(isLoggedInProvider);
            return isLoggedIn.when(
              data: ((data) {
                if (data == false) {
                  return const ProjectSelectionView();
                } else {
                  return const LoginView();
                }
              }),
              error: (Object error, StackTrace stackTrace) {
                return const Text('error');
              },
              loading: () {
                return const Text('loading');
              },
            );
          },
        ),
      ),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: const Text('honmePage'),
    );
  }
}
