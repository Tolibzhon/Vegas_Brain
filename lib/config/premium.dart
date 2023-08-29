import 'package:shared_preferences/shared_preferences.dart';

class Premium {
  static Future<bool> getSubscrp() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('ISBUY') ?? false;
  }

  static Future<void> setSubscrp() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('ISBUY', true);
  }
}
