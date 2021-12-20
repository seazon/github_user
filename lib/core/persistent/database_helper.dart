import 'dart:io';
import 'package:github_user/core/model/github_user.dart';
import 'package:github_user/utils/log_plugin.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart';

/// This is the implementation of a specific database framework, we can replace it with a different framework
class DatabaseHelper with LogPlugin {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static late Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "main.db");
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE User(id INTEGER PRIMARY KEY, login TEXT, avatar_url TEXT)");
    d("Table is created");
  }

  Future<List<Map<String, dynamic>>> getAllUsers() async {
    var dbClient = await db;
    return await dbClient.query("User", columns: ['id', 'login', 'avatar_url']);
  }

  /// insertion
  Future<int> saveUser(GithubUserResultItem user) async {
    var dbClient = await db;
    int res = await dbClient.insert("User", user.toJson());
    return res;
  }

  Future<List<dynamic>> saveUsers(List<GithubUserResultItem> users) async {
    var dbClient = await db;
    var batch = dbClient.batch();
    batch.delete("User");
    users.forEach((element) {
      batch.insert("User", element.toJson());
    });
    return await batch.commit();
  }

  /// deletion
  Future<int> deleteUser(GithubUserResultItem user) async {
    var dbClient = await db;
    int res = await dbClient.delete("User");
    return res;
  }
}
