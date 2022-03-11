import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {

  @Deprecated("")
  Future<int> incrementCounter() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    int counter = (sp.getInt("counter") ?? 0) + 1;
    await sp.setInt("counter", counter);
    return counter;
  }
}
