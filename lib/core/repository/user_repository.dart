import 'package:github_user/app/locator.dart';
import 'package:github_user/core/api/api_service.dart';
import 'package:github_user/core/model/github_user.dart';
import 'package:github_user/core/persistent/database_service.dart';
import 'package:github_user/core/persistent/shared_preferences_service.dart';

class GithubUserRepository {
  final ApiService _apiService = locator<ApiService>();
  final DatabaseService _databaseService = locator<DatabaseService>();
  final SharedPreferencesService _sharedPreferencesService =
      locator<SharedPreferencesService>();

  Future<GithubUserResult?> search(String keyword) async {
    return _apiService.search(keyword);
  }

  Future<List<GithubUserResultItem>> getAllUsers() async {
    return _databaseService.getAllUsers();
  }

  Future<void> saveUsers(List<GithubUserResultItem> users) async {
    _databaseService.saveUsers(users);
  }

  @Deprecated("")
  Future<int> incrementCounter() async {
    return _sharedPreferencesService.incrementCounter();
  }
}
