import 'package:arbaeen_reporter/features/sign-up/presentation/screens/sign_up_dialog.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.grey,
      body: SignUpDialog(),
    );
  }
}
