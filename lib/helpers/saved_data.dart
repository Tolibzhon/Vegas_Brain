import 'package:shared_preferences/shared_preferences.dart';

class SavedData {
  static Future<int> getCoin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('Coin') ?? 10000;
  }

  static Future<void> setCoin(int coin) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('Coin', coin);
  }
}
