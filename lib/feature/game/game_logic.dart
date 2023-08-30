import 'package:vegas_brain_game/helpers/app_card.dart';
import 'package:vegas_brain_game/helpers/const.dart';
import 'package:vegas_brain_game/helpers/saved_data.dart';

class Game {
  // final String hiddenCardpath = 'assets/images/imageEmpty.png';

  String text = '';
  int indexBg = 0;

  Future<void> aaa() async {
    text = await SavedData.getGameMode();
    indexBg = await SavedData.getBgIndex();
  }

  late String hiddenCardpath = AppCard.bgcard;

  List<String>? gameImg = [];

  late List<String> cards_list = indexBg == 0
      ? [
          AppCard.one1,
          AppCard.one2,
          AppCard.one3,
          AppCard.one4,
          AppCard.one5,
          AppCard.one6,
          AppCard.one7,
          AppCard.one9,
          AppCard.one10,
        ]
      : indexBg == 1
          ? [
              AppCard.two1,
              AppCard.two2,
              AppCard.two3,
              AppCard.two4,
              AppCard.two5,
              AppCard.two6,
              AppCard.two7,
              AppCard.two8,
              AppCard.two9,
            ]
          : indexBg == 2
              ? [
                  AppCard.three1,
                  AppCard.three2,
                  AppCard.three3,
                  AppCard.three4,
                  AppCard.three5,
                  AppCard.three6,
                  AppCard.three7,
                  AppCard.three8,
                  AppCard.three9,
                ]
              : indexBg == 3
                  ? [
                      AppCard.four1,
                      AppCard.four2,
                      AppCard.four3,
                      AppCard.four4,
                      AppCard.four5,
                      AppCard.four6,
                      AppCard.four7,
                      AppCard.four8,
                      AppCard.four9,
                    ]
                  : indexBg == 4
                      ? [
                          AppCard.five1,
                          AppCard.five2,
                          AppCard.five3,
                          AppCard.five4,
                          AppCard.five5,
                          AppCard.five6,
                          AppCard.five7,
                          AppCard.five8,
                          AppCard.five9,
                        ]
                      : indexBg == 5
                          ? [
                              AppCard.six1,
                              AppCard.six2,
                              AppCard.six3,
                              AppCard.six4,
                              AppCard.six5,
                              AppCard.six6,
                              AppCard.six7,
                              AppCard.six8,
                              AppCard.six9,
                            ]
                          : indexBg == 6
                              ? [
                                  AppCard.seven1,
                                  AppCard.seven2,
                                  AppCard.seven3,
                                  AppCard.seven4,
                                  AppCard.seven5,
                                  AppCard.seven6,
                                  AppCard.seven7,
                                  AppCard.seven8,
                                  AppCard.seven9,
                                ]
                              : indexBg == 7
                                  ? [
                                      AppCard.eight1,
                                      AppCard.eight2,
                                      AppCard.eight3,
                                      AppCard.eight4,
                                      AppCard.eight5,
                                      AppCard.eight6,
                                      AppCard.eight7,
                                      AppCard.eight8,
                                      AppCard.eight9,
                                    ]
                                  : indexBg == 8
                                      ? [
                                          AppCard.nine1,
                                          AppCard.nine2,
                                          AppCard.nine3,
                                          AppCard.nine4,
                                          AppCard.nine5,
                                          AppCard.nine6,
                                          AppCard.nine7,
                                          AppCard.nine8,
                                          AppCard.nine9,
                                        ]
                                      : indexBg == 9
                                          ? [
                                              AppCard.ten1,
                                              AppCard.ten2,
                                              AppCard.ten3,
                                              AppCard.ten4,
                                              AppCard.ten5,
                                              AppCard.ten6,
                                              AppCard.ten7,
                                              AppCard.ten8,
                                              AppCard.ten9,
                                            ]
                                          : indexBg == 10
                                              ? [
                                                  AppCard.eleven1,
                                                  AppCard.eleven2,
                                                  AppCard.eleven3,
                                                  AppCard.eleven4,
                                                  AppCard.eleven5,
                                                  AppCard.eleven6,
                                                  AppCard.eleven7,
                                                  AppCard.eleven8,
                                                  AppCard.eleven9,
                                                ]
                                              : [
                                                  AppCard.twelve1,
                                                  AppCard.twelve2,
                                                  AppCard.twelve3,
                                                  AppCard.twelve4,
                                                  AppCard.twelve5,
                                                  AppCard.twelve6,
                                                  AppCard.twelve7,
                                                  AppCard.twelve8,
                                                  AppCard.twelve9,
                                                ];

  List<Map<int, String>> matchCheck = [];

  int get cardCount {
    if (text == GameMode.x23) {
      return 6;
    } else if (text == GameMode.x24) {
      return 8;
    } else if (text == GameMode.x25) {
      return 10;
    } else if (text == GameMode.x34) {
      return 12;
    } else {
      return 18;
    }
  }

  Future<void> initGame() async {
    await aaa();
    // Проверяем, что список 'selectedCards' имеет хотя бы cardCount / 2 элементов
    List<String> selectedCards = cards_list..shuffle();
    if (selectedCards.length < cardCount ~/ 2) {
      int remainingElements = cardCount ~/ 2 - selectedCards.length;
      while (remainingElements > 0) {
        selectedCards.addAll(cards_list);
        selectedCards.shuffle();
        remainingElements = cardCount ~/ 2 - selectedCards.length;
      }
    }

    selectedCards = selectedCards.sublist(0, cardCount ~/ 2);

    // Дублируем выбранные картинки, чтобы получить cardCount картинок с одинаковыми названиями
    List<String> duplicatedCards = [];
    for (int i = 0; i < cardCount ~/ 2; i++) {
      duplicatedCards.add(selectedCards[i]);
      duplicatedCards.add(selectedCards[i]);
    }

    // Перемешиваем итоговый список дублированных карт
    duplicatedCards.shuffle();

    // Создаем список с заданным количеством картинок, и все карты изначально закрыты
    gameImg = List.generate(cardCount, (index) => hiddenCardpath);

    // Присваиваем полученные картинки к разным позициям в gameImg
    for (int i = 0; i < cardCount; i++) {
      gameImg![i] = duplicatedCards[i];
    }
  }
}
