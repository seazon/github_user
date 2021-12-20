import 'package:github_user/core/model/github_user.dart';

import 'database_helper.dart';

class DatabaseService {
  final db = DatabaseHelper();

  Future<List<GithubUserResultItem>> getAllUsers() async {
    var dd = await db.getAllUsers();
    return dd.map((e) => GithubUserResultItem.fromJson(e)).toList();
  }

  Future<void> saveUsers(List<GithubUserResultItem> users) async {
    db.saveUsers(users);
  }
}
