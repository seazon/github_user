import 'dart:convert';
import 'dart:io';

import 'package:github_user/core/model/github_user.dart';
import 'package:github_user/util/log_plugin.dart';
import 'package:http/http.dart' as http;

class ApiService with LogPlugin {
  Future<GithubUserResult?> search(String keyword) async {
    http.Response response = await http.get(
        Uri.parse("https://api.github.com/search/users?q=$keyword&page=1"));
    if (response.statusCode == HttpStatus.ok) {
      d("response: ${response.body}");
      return GithubUserResult.fromJson(jsonDecode(response.body));
    } else {
      d("statusCode: ${response.statusCode}");
      return null;
    }
  }
}
