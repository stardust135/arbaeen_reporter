import 'package:flutter/material.dart';

import '../../features/report/screens/report-screen.dart';
import '../../screen_wrapper.dart';

class Routes {
  static const String screensWrapper = '/';
  static const String reportScreen = '/reportScreen';

  static Route<dynamic> generateRoute(RouteSettings rs) {
    switch (rs.name) {
      case screensWrapper:
        return MaterialPageRoute(
          builder: (context) => const ScreensWrapper(),
        );
      case reportScreen:
        return MaterialPageRoute(
          builder: (context) => const ReportScreen(),
        );
      default:
        throw const FormatException('Route not found!');
    }
  }
}
