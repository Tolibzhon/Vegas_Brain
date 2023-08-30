import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegas_brain_game/helpers/const.dart';

class SavedData {
  static Future<int> getCoin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('Coin') ?? 10000;
  }

  static Future<void> setCoin(int coin) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('Coin', coin);
  }
  
  static Future<String> getGameSimply() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('GameSimply') ?? GameSimply.norm;
  }

  static Future<void> setGameSimply(String gameSimply) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('GameSimply', gameSimply);
  }

  static Future<String> getGameMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('GameMode') ?? GameMode.x24;
  }

  static Future<void> setGameMode(String gameMode) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('GameMode', gameMode);
  }
}
