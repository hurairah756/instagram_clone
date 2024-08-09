import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagramui/screens/auth/signup_screen.dart';

import 'auth_controller.dart';
import 'login_screen.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.watch(authControllerProvider);
    final authControllerNotifier = ref.read(authControllerProvider.notifier);

    return authController.showLoginScreen
        ? LoginScreen(() => authControllerNotifier.showLoginScreen = false)
        : SignupScreen(() => authControllerNotifier.showLoginScreen = true);
  }
}
