import 'package:flix_id/presentation/providers/router/router_provider.dart';
import 'package:flix_id/presentation/providers/user_data/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(userDataProvider, (prev, next) {
      if (next is AsyncData) {
        if (next.value != null) {
          ref.read(routerProvider).goNamed('main');
        } else if (next is AsyncError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                next.error.toString(),
              ),
            ),
          );
        }
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Data'),
            ElevatedButton(
              onPressed: () {
                ref
                    .watch(userDataProvider.notifier)
                    .login(email: 'frdnhmrf@gmail.com', password: 'Cahelek20');
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
