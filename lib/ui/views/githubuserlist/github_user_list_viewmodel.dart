import 'package:github_user/core/model/github_user.dart';
import 'package:github_user/core/repository/user_repository.dart';

import '../basic_viewmodel.dart';

class GithubUserListViewModel extends BasicViewModel {
  GithubUserRepository repository = GithubUserRepository();
  List<GithubUserResultItem> users = <GithubUserResultItem>[];
  String keyword = "";
  bool isLoading = false;

  Future<void> search(String keyword) async {
    this.keyword = keyword;
    users.clear();
    isLoading = true;
    notifyListeners();

    final results = await repository.search(keyword);
    if (results == null) {
      d("search results = null");
      d("get from database");
      users = await repository.getAllUsers();
      d(users);
    } else {
      users = results.items ?? <GithubUserResultItem>[];
      if (users != null) {
        repository.saveUsers(users);
      }
      d(users);
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> refresh() async {
    search(keyword);
  }
}
