import 'package:get_it/get_it.dart';

import '../../locator.dart';
import '../repositories/api_manager.dart';
import '../repositories/app_db_manager.dart';

extension GetInstantExtension on GetIt {
  ApiManager get apiManager => locator<ApiManager>();

  AppDbManager get appDbManager => locator<AppDbManager>();
}
