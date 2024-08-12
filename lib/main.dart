import 'package:arbaeen_reporter/core/utils/extensions.dart';
import 'package:arbaeen_reporter/features/report/screens/report-screen.dart';
import 'package:arbaeen_reporter/features/sign-up/presentation/bloc/sign_up_bloc.dart';
import 'package:arbaeen_reporter/screen_wrapper.dart';

import 'config/routes/routes.dart';
import 'core/bloc/app_bloc.dart';
import 'locator.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  await Hive.initFlutter();
  await locator.appDbManager.initValues();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppBloc(locator()),
        ),
        BlocProvider(
          create: (context) => SignUpBloc(
            userDataUseCase: locator(),
            smsUseCase: locator(),
          ),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(useMaterial3: false),
        initialRoute: Routes.screensWrapper,
        onGenerateRoute: Routes.generateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
