import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegas_brain_game/helpers/const.dart';

class SavedData {
  static Future<bool> getTime() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('IsTime') ?? false;
  }

  static Future<void> setTime(bool time) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('IsTime', time);
  }

  static Future<bool> getAttempts() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('IsAttem') ?? false;
  }

  static Future<void> setAttempts(bool attem) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('IsAttem', attem);
  }

  static Future<int> getQuest() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('Quest') ?? 0;
  }

  static Future<void> setQuest(int quest) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('Quest', quest);
  }

  static Future<int> getCoin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('Coin') ?? 10000;
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

//-----------------------------------------
  static Future<int> getTournament() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('Tournament') ?? 1;
  }

  static Future<void> setTournament(int tournament) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('Tournament', tournament);
  }

  static Future<int> getPlayer() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('Player') ?? 1;
  }

  static Future<void> setPlayer(int player) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('Player', player);
  }

  static Future<int> getPlayer1() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('Player1') ?? 0;
  }

  static Future<void> setPlayer1(int player) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('Player1', player);
  }

  static Future<int> getPlayer2() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('Player2') ?? 0;
  }

  static Future<void> setPlayer2(int player) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('Player2', player);
  }

//-----------------------------------------
}
