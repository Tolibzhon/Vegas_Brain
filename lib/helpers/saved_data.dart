import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegas_brain_game/helpers/const.dart';

class SavedData {
  static Future<int> getCoin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('Coin') ?? 1000;
  }

  static Future<void> setCoin(int coin) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('Coin', coin);
  }

  static Future<int> getDymond() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('Dymond') ?? 25;
  }

  static Future<void> setDymond(int dymond) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('Dymond', dymond);
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

  static Future<int> getBgIndex() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('BgIndex') ?? 0;
  }

  static Future<void> setBgIndex(int bgIndex) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('BgIndex', bgIndex);
  }

  static Future<List<String>> getShopListChek() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('ShopListChek') ?? [];
  }

  static Future<void> setShopListChek(List<String> shopListChek) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('ShopListChek', shopListChek);
  }
}
