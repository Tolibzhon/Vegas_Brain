// import 'package:vegas_brain_game/helpers/app_images.dart';
// import 'package:vegas_brain_game/helpers/const.dart';
// import 'package:vegas_brain_game/helpers/saved_data.dart';

// class Game {
//   // final String hiddenCardpath = 'assets/images/imageEmpty.png';

//   String text = '';
//   int indexBg = 0;

//   Future<void> aaa() async {
//     text = await SavedData.getGameMode();
//     indexBg = await SavedData.getBgIndex();
//   }

//   late String hiddenCardpath = AppImages.closeIcon;

//   List<String>? gameImg = [];

//   late List<String> cards_list = indexBg == 0
//       ? [
//           AppImages.one1,
//           AppImages.one2,
//           AppImages.one3,
//           AppImages.one4,
//           AppImages.one5,
//           AppImages.one6,
//           AppImages.one7,
//           AppImages.one8,
//           AppImages.one9,
//         ]
//       : indexBg == 1
//           ? [
//               AppImages.two1,
//               AppImages.two2,
//               AppImages.two3,
//               AppImages.two4,
//               AppImages.two5,
//               AppImages.two6,
//               AppImages.two7,
//               AppImages.two8,
//               AppImages.two9,
//             ]
//           : indexBg == 2
//               ? [
//                   AppImages.three1,
//                   AppImages.three2,
//                   AppImages.three3,
//                   AppImages.three4,
//                   AppImages.three5,
//                   AppImages.three6,
//                   AppImages.three7,
//                   AppImages.three8,
//                   AppImages.three9,
//                 ]
//               : indexBg == 3
//                   ? [
//                       AppImages.four1,
//                       AppImages.four2,
//                       AppImages.four3,
//                       AppImages.four4,
//                       AppImages.four5,
//                       AppImages.four6,
//                       AppImages.four7,
//                       AppImages.four8,
//                       AppImages.four9,
//                     ]
//                   : indexBg == 4
//                       ? [
//                           AppImages.four1,
//                           AppImages.four2,
//                           AppImages.four3,
//                           AppImages.four4,
//                           AppImages.four5,
//                           AppImages.four6,
//                           AppImages.four7,
//                           AppImages.four8,
//                           AppImages.four9,
//                         ]
//                       : indexBg == 5
//                           ? [
//                               AppImages.four1,
//                               AppImages.four2,
//                               AppImages.four3,
//                               AppImages.four4,
//                               AppImages.four5,
//                               AppImages.four6,
//                               AppImages.four7,
//                               AppImages.four8,
//                               AppImages.four9,
//                             ]
//                           : indexBg == 6
//                               ? [
//                                   AppImages.four1,
//                                   AppImages.four2,
//                                   AppImages.four3,
//                                   AppImages.four4,
//                                   AppImages.four5,
//                                   AppImages.four6,
//                                   AppImages.four7,
//                                   AppImages.four8,
//                                   AppImages.four9,
//                                 ]
//                               : indexBg == 7
//                                   ? [
//                                       AppImages.four1,
//                                       AppImages.four2,
//                                       AppImages.four3,
//                                       AppImages.four4,
//                                       AppImages.four5,
//                                       AppImages.four6,
//                                       AppImages.four7,
//                                       AppImages.four8,
//                                       AppImages.four9,
//                                     ]
//                                   : indexBg == 8
//                                       ? [
//                                           AppImages.four1,
//                                           AppImages.four2,
//                                           AppImages.four3,
//                                           AppImages.four4,
//                                           AppImages.four5,
//                                           AppImages.four6,
//                                           AppImages.four7,
//                                           AppImages.four8,
//                                           AppImages.four9,
//                                         ]
//                                       : indexBg == 9
//                                           ? [
//                                               AppImages.four1,
//                                               AppImages.four2,
//                                               AppImages.four3,
//                                               AppImages.four4,
//                                               AppImages.four5,
//                                               AppImages.four6,
//                                               AppImages.four7,
//                                               AppImages.four8,
//                                               AppImages.four9,
//                                             ]
//                                           : indexBg == 10
//                                               ? [
//                                                   AppImages.four1,
//                                                   AppImages.four2,
//                                                   AppImages.four3,
//                                                   AppImages.four4,
//                                                   AppImages.four5,
//                                                   AppImages.four6,
//                                                   AppImages.four7,
//                                                   AppImages.four8,
//                                                   AppImages.four9,
//                                                 ]
//                                               : [
//                                                   AppImages.four1,
//                                                   AppImages.four2,
//                                                   AppImages.four3,
//                                                   AppImages.four4,
//                                                   AppImages.four5,
//                                                   AppImages.four6,
//                                                   AppImages.four7,
//                                                   AppImages.four8,
//                                                   AppImages.four9,
//                                                 ];

//   List<Map<int, String>> matchCheck = [];

//   int get cardCount {
//     if (text == GameMode.x23) {
//       return 6;
//     } else if (text == GameMode.x24) {
//       return 8;
//     } else if (text == GameMode.x25) {
//       return 10;
//     } else if (text == GameMode.x34) {
//       return 12;
//     }else{
//       return 18;
//     }
//   }

//   Future<void> initGame() async {
//     await aaa();
//     // Проверяем, что список 'selectedCards' имеет хотя бы cardCount / 2 элементов
//     List<String> selectedCards = cards_list..shuffle();
//     if (selectedCards.length < cardCount ~/ 2) {
//       int remainingElements = cardCount ~/ 2 - selectedCards.length;
//       while (remainingElements > 0) {
//         selectedCards.addAll(cards_list);
//         selectedCards.shuffle();
//         remainingElements = cardCount ~/ 2 - selectedCards.length;
//       }
//     }

//     selectedCards = selectedCards.sublist(0, cardCount ~/ 2);

//     // Дублируем выбранные картинки, чтобы получить cardCount картинок с одинаковыми названиями
//     List<String> duplicatedCards = [];
//     for (int i = 0; i < cardCount ~/ 2; i++) {
//       duplicatedCards.add(selectedCards[i]);
//       duplicatedCards.add(selectedCards[i]);
//     }

//     // Перемешиваем итоговый список дублированных карт
//     duplicatedCards.shuffle();

//     // Создаем список с заданным количеством картинок, и все карты изначально закрыты
//     gameImg = List.generate(cardCount, (index) => hiddenCardpath);

//     // Присваиваем полученные картинки к разным позициям в gameImg
//     for (int i = 0; i < cardCount; i++) {
//       gameImg![i] = duplicatedCards[i];
//     }
//   }
// }
