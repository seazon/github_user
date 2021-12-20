import 'package:flutter/material.dart';
import 'package:github_user/util/log_plugin.dart';

import 'tab_viewmodel.dart';

class TabLayout extends StatefulWidget {
  final TabViewModel model;

  TabLayout({required this.model});

  @override
  __TabLayoutState createState() => __TabLayoutState(model: model);
}

class __TabLayoutState extends State<TabLayout>
    with SingleTickerProviderStateMixin, LogPlugin {
  late TabController _tabController;
  final TabViewModel model;

  __TabLayoutState({required this.model});

  final List<Tab> myTabs = <Tab>[
    Tab(
      text: "tab 1",
    ),
    Tab(
      text: "tab 2",
    ),
    Tab(
      text: "tab 3",
    ),
  ];

  @override
  void initState() {
    super.initState();

    _tabController =
        TabController(vsync: this, initialIndex: 0, length: myTabs.length);
    _tabController.addListener(() {
//      var a  = _tabController.index;
//      model.showDialog(title: "alert!", description: "tab tapped");
      d("tab tapped");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: myTabs,
          ),
        ),
        TabBar(
          labelColor: Colors.lightGreen,
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.camera_alt),
              text: "Camera",
            ),
            Tab(
              icon: Icon(Icons.chat),
              text: "Chats",
            ),
            Tab(
              icon: Icon(Icons.call),
              text: "Call",
            )
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
}
