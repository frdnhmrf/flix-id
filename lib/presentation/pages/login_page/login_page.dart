import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/usecases/login/login.dart';
import '../../providers/usecases/login_provider.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                Login login = ref.watch(loginProvider);

                login(LoginParams(
                        email: 'frdnhmrf@gmail.com', password: 'Cahelek20'))
                    .then((result) => result);
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
