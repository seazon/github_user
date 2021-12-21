import 'package:github_user/ui/views/location/location_navigator.dart';
import 'package:github_user/utils/location_plugin.dart';
import 'package:github_user/utils/permission_handle_plugin.dart';
import 'package:location/location.dart';

import '../basic_viewmodel.dart';

class LocationViewModel extends BasicViewModel
    with LocationPlugin, PermissionPlugin {
  LocationData? _locationData;

  LocationData? get locationData => _locationData;

  final LocationNavigator navigator;

  LocationViewModel({required this.navigator});

  void requestLocation() async {
    try {
      _locationData = await location();
      if (_locationData != null) {
        d("got location Data, notify");
        notifyListeners();
      }
    } catch (e) {
      navigator.showErrorDialog();
    }
  }
}
