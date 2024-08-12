import 'package:arbaeen_reporter/core/utils/extensions.dart';
import 'package:arbaeen_reporter/features/report/screens/report-screen.dart';
import 'package:arbaeen_reporter/features/sign-up/presentation/screens/sign_up_dialog.dart';
import 'package:arbaeen_reporter/locator.dart';
import 'package:flutter/material.dart';

class ScreensWrapper extends StatelessWidget {
  const ScreensWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return const ReportScreen();

    return locator.appDbManager.hasLoggedIn
        ? const ReportScreen()
        : Scaffold(
            backgroundColor: Colors.grey.shade100,
            body: const SignUpDialog(),
          );
  }
}
