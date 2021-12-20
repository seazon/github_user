import 'package:location_permissions/location_permissions.dart';

mixin LocationPermissionsPlugin {
  Future<bool> openAppSettings() async{
    return await LocationPermissions().openAppSettings();
  }
}
