import 'package:flutter/material.dart';
import 'package:github_user/core/model/github_user.dart';

import '../basic_view.dart';
import 'github_user_list_viewmodel.dart';

class GithubUserListView extends BasicView<GithubUserListViewModel> {
  late TextEditingController _controller; // TODO should as a final

  void init(GithubUserListViewModel model) {
    String keyword = "wcl";
//    model.search(keyword);
    _controller = TextEditingController(text: keyword);
  }

  @override
  Widget builder(
      BuildContext context, GithubUserListViewModel model, Widget? child) {
    init(model); // TODO should put init method in right place
    return Scaffold(
        appBar: AppBar(title: Text("Search Github User: ${model.counter}")),
        body: Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: _controller,
                  onSubmitted: (value) {
                    if (value.isNotEmpty) {
                      model.search(value);
                    }
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none),
                ),
              ),
              Offstage(
                offstage: !model.isLoading,
                child: CircularProgressIndicator(),
              ),
              Expanded(
                  child: RefreshIndicator(
                onRefresh: model.refresh,
                child: _UserList(users: model.users),
              ))
            ])));
  }

  @override
  GithubUserListViewModel viewModelBuilder(BuildContext context) =>
      GithubUserListViewModel();
}

class _UserList extends StatelessWidget {
  final List<GithubUserResultItem> users;

  _UserList({required this.users});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.users.length,
      itemBuilder: (context, index) {
        final user = this.users[index];

        return ListTile(
          contentPadding: EdgeInsets.all(10),
          leading: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(user.avatar_url)),
                borderRadius: BorderRadius.circular(6)),
            width: 50,
            height: 100,
          ),
          title: Text(user.login),
        );
      },
    );
  }
}
