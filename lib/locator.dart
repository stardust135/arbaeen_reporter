import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import 'core/repositories/api_manager.dart';
import 'core/repositories/app_db_manager.dart';
import 'core/repositories/app_repository.dart';
import 'features/sign-up/data/data-sources/sign_up_remote_data_source.dart';
import 'features/sign-up/data/repository/sign_up_repository_impl.dart';
import 'features/sign-up/domain/repositories/sign_up_repository.dart';
import 'features/sign-up/domain/use-cases/get_user_data.dart';
import 'features/sign-up/domain/use-cases/send_sms_use_case.dart';

final locator = GetIt.instance;
final logger = Logger();

Future<void> setupLocator() async {
  //! Features - Spinner Wheel to injection

  // Dio
  locator.registerSingleton<Dio>(Dio());

  // Data sources
  locator.registerLazySingleton<SingUpRemoteDataSource>(
      () => SingUpRemoteDataSourceImpl(dio: locator()));

  // Repository
  locator.registerLazySingleton<SignUpRepository>(
      () => SignUpRepositoryImpl(remoteDataSource: locator()));

  // Use cases
  locator.registerLazySingleton(
      () => GetUserDataUseCase(signUpRepository: locator()));

  locator
      .registerLazySingleton(() => SendSmsUseCase(signUpRepository: locator()));

  locator.registerSingleton<AppRepository>(AppRepository());

  locator.registerSingleton<ApiManager>(ApiManager(locator()));

  locator.registerSingleton<AppDbManager>(AppDbManager());
}
