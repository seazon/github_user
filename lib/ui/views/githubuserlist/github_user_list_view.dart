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
        body: Container(
            padding: EdgeInsets.fromLTRB(
                10, MediaQuery.of(context).viewPadding.top, 10, 10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 18),
                padding: EdgeInsets.only(left: 16),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 245, 245, 245),
                    borderRadius: BorderRadius.circular(24)),
                child: TextField(
                  controller: _controller,
                  onSubmitted: (value) {
                    if (value.isNotEmpty) {
                      model.search(value);
                    }
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.black, fontSize: 13),
                      suffix: GestureDetector(
                        onTap: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          model.search(_controller.text);
                        },
                        child: SizedBox(
                          width: 56.0,
                          child: Image(
                            image: AssetImage("images/search.png"),
                            width: 13.0,
                            height: 15.0,
                          ),
                        ),
                      ),
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
            horizontalTitleGap: 16,
            contentPadding: EdgeInsets.all(10),
            leading: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(user.avatar_url)),
                  borderRadius: BorderRadius.circular(16)),
              width: 32,
              height: 32,
            ),
            minLeadingWidth: 0,
            title: Text(user.login,
                style: TextStyle(color: Colors.black, fontSize: 13)),
            trailing: Container(
              width: 55,
              height: 24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.black,
              ),
              alignment: Alignment.center,
              child: Text("关注",
                  style: TextStyle(color: Colors.white, fontSize: 11)),
            ));
      },
    );
  }
}
