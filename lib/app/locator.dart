import 'package:get_it/get_it.dart';
import 'package:github_user/core/api/api_service.dart';
import 'package:github_user/core/persistent/database_service.dart';
import 'package:github_user/core/persistent/shared_preferences_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => ApiService());
  locator.registerLazySingleton(() => DatabaseService());
  locator.registerLazySingleton(() => SharedPreferencesService());
}
