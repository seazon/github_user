import 'package:flutter/material.dart';
import './tab_layout_widget.dart';
import './tab_viewmodel.dart';
import '../basic_view.dart';

class TabView extends BasicView<TabViewModel> {
  @override
  Widget builder(BuildContext context, TabViewModel model, Widget? child) {
    return Scaffold(
        appBar: AppBar(
          title: Text("tab"),
          actions: <Widget>[
            Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  model.showSnackBar(message: "search menu tapped");
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
            ),
            Icon(Icons.more_vert)
          ],
        ),
        body: TabLayout(
          model: model,
        ));
  }

  @override
  TabViewModel viewModelBuilder(BuildContext context) {
    return TabViewModel();
  }
}
