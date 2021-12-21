import 'package:permission_handler/permission_handler.dart';

mixin PermissionPlugin {
  Future<bool> gotoAppSettings() async {
    return await openAppSettings();
  }
}
