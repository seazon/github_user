import 'package:flutter/material.dart';
import 'package:github_user/generated/l10n.dart';
import 'package:github_user/ui/views/location/location_navigator.dart';

import '../basic_view.dart';
import 'location_viewmodel.dart';

class LocationView extends BasicView<LocationViewModel>
    implements LocationNavigator {
  late LocationViewModel _model;
  late BuildContext _context;

  @override
  LocationViewModel viewModelBuilder(BuildContext context) {
    _context = context;
    _model = LocationViewModel(navigator: this);
    _model.requestLocation();
    return _model;
  }

  @override
  Widget builder(BuildContext context, LocationViewModel model, Widget? child) {
    d("builder LocationView");
    return Scaffold(
      appBar: AppBar(
        title: Text("location"),
      ),
      body: Column(
        children: <Widget>[
          MaterialButton(onPressed: () => model.requestLocation()),
          Text(model.locationData.toString())
        ],
      ),
    );
  }

  @override
  void showErrorDialog() {
    _model.showDialog(
      title: S.of(_context).common_alert,
      description: S.of(_context).location_permission_not_grant_description,
      cancelTitle: S.of(_context).common_cancel,
      buttonTitle: S.of(_context).location_permission_go_to_setting,
      onTap: () {
        _model.openAppSettings();
      },
    );
  }
}
