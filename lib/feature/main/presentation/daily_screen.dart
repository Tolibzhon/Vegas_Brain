import 'package:flutter/material.dart';
import 'package:vegas_brain_game/feature/main/presentation/widget/widget_daily.dart';
import 'package:vegas_brain_game/feature/widgets/spaces.dart';
import 'package:vegas_brain_game/helpers/app_images.dart';
import 'package:vegas_brain_game/helpers/saved_data.dart';

class DailyScreen extends StatefulWidget {
  const DailyScreen({super.key});

  @override
  State<DailyScreen> createState() => _DailyScreenState();
}

class _DailyScreenState extends State<DailyScreen> {
  late String day;
  int coin = 0;
  int dymond = 0;

  DateTime date = DateTime.now();

  List<String> list = [];
  List<String> dayListChek = [];

  int dayInt = 0;

  @override
  void initState() {
    super.initState();
    savedData();
  }

  Future<void> savedData() async {
    var coinSavedData = await SavedData.getCoin();
    var dymondSavedData = await SavedData.getDymond();
    var listSavedData = await SavedData.getDailyListChek();
    var dayIntSavedData = await SavedData.getDay();
    var dayListChekSavedData = await SavedData.getDayListChek();
    setState(() {
      coin = coinSavedData;
      dymond = dymondSavedData;
      list = listSavedData;
      dayInt = dayIntSavedData;
      dayListChek = dayListChekSavedData;
    });
    day = '$dayInt';
    print(day);
    print(dayInt);
    if (dayInt > 6) {
      print('aaaaaa');
      dayInt = 0;
      await SavedData.setDay(dayInt);
      list.clear();
      dayListChek.clear();
      await SavedData.setDailyListChek(list);
      await SavedData.setDayListChek(dayListChek);
    } else if (date.weekday == 1) {
      if (dayListChek.contains('1')) {
      } else {
        dayInt += 1;
        dayListChek.add('1');
        await SavedData.setDay(dayInt);
        await SavedData.setDayListChek(dayListChek);
      }
    } else if (date.weekday == 2) {
     if (dayListChek.contains('2')) {
      } else {
        dayInt += 1;
        dayListChek.add('2');
        await SavedData.setDay(dayInt);
        await SavedData.setDayListChek(dayListChek);
      }
    } else if (date.weekday == 3) {
      if (dayListChek.contains('3')) {
      } else {
        dayInt += 1;
        dayListChek.add('3');
        await SavedData.setDay(dayInt);
        await SavedData.setDayListChek(dayListChek);
      }
    } else if (date.weekday == 4) {
      if (dayListChek.contains('4')) {
      } else {
        dayInt += 1;
        dayListChek.add('4');
        await SavedData.setDay(dayInt);
        await SavedData.setDayListChek(dayListChek);
      }
    } else if (date.weekday == 5) {
     if (dayListChek.contains('5')) {
      } else {
        dayInt += 1;
        dayListChek.add('5');
        await SavedData.setDay(dayInt);
        await SavedData.setDayListChek(dayListChek);
      }
    } else if (date.weekday == 6) {
      if (dayListChek.contains('6')) {
      } else {
        dayInt += 1;
        dayListChek.add('6');
        await SavedData.setDay(dayInt);
        await SavedData.setDayListChek(dayListChek);
      }
    } else if (date.weekday == 7) {
      if (dayListChek.contains('7')) {
      } else {
        dayInt += 1;
        dayListChek.add('7');
        await SavedData.setDay(dayInt);
        await SavedData.setDayListChek(dayListChek);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: getHeight(context),
        width: getWidth(context),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.imageBg), fit: BoxFit.cover),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff061E4C),
              Color(0xff0A3378),
            ],
          ),
          color: Colors.white,
        ),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff35A4FD),
                  Color(0xff0C60AE),
                ],
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 30),
                      Image.asset(AppImages.dailyText, width: 220),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          AppImages.closeIcon,
                          width: 40,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      WidgetDaily(
                        image: AppImages.day1,
                        text: list.contains('1')
                            ? day == '1'
                                ? 'DONE'
                                : 'DONE'
                            : 'GET',
                        isActive: list.contains('1')
                            ? day == '1'
                                ? 1
                                : 1
                            : dayInt == 1
                                ? 2
                                : 3,
                        onTap: dayInt == 1
                            ? () async {
                                setState(() {
                                  day = '1';
                                });
                                coin = coin + 25;
                                await SavedData.setCoin(coin);
                                list.add(day);
                                await SavedData.setDailyListChek(list);
                              }
                            : () {},
                      ),
                      WidgetDaily(
                        image: AppImages.day2,
                        text: list.contains('2')
                            ? day == '2'
                                ? 'DONE'
                                : 'DONE'
                            : 'GET',
                        isActive: list.contains('2')
                            ? day == '2'
                                ? 1
                                : 1
                            : dayInt == 2
                                ? 2
                                : 3,
                        onTap: dayInt == 2
                            ? () async {
                                setState(() {
                                  day = '2';
                                });
                                coin = coin + 50;
                                await SavedData.setCoin(coin);
                                list.add(day);
                                await SavedData.setDailyListChek(list);
                              }
                            : () {},
                      ),
                    ],
                  ),
                  /////////////////////////////////
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      WidgetDaily(
                        image: AppImages.day3,
                        text: list.contains('3')
                            ? day == '3'
                                ? 'DONE'
                                : 'DONE'
                            : 'GET',
                        isActive: list.contains('3')
                            ? day == '3'
                                ? 1
                                : 1
                            : dayInt == 3
                                ? 2
                                : 3,
                        onTap: dayInt == 3
                            ? () async {
                                setState(() {
                                  day = '3';
                                });
                                coin = coin + 150;
                                await SavedData.setCoin(coin);
                                list.add(day);
                                await SavedData.setDailyListChek(list);
                              }
                            : () {},
                      ),
                      WidgetDaily(
                        image: AppImages.day4,
                        text: list.contains('4')
                            ? day == '4'
                                ? 'DONE'
                                : 'DONE'
                            : 'GET',
                        isActive: list.contains('4')
                            ? day == '4'
                                ? 1
                                : 1
                            : dayInt == 4
                                ? 2
                                : 3,
                        onTap: dayInt == 4
                            ? () async {
                                setState(() {
                                  day = '4';
                                });
                                coin = coin + 250;
                                await SavedData.setCoin(coin);
                                list.add(day);
                                await SavedData.setDailyListChek(list);
                              }
                            : () {},
                      ),
                    ],
                  ),
                  /////////////////////////////////
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      WidgetDaily(
                        image: AppImages.day5,
                        text: list.contains('5')
                            ? day == '5'
                                ? 'DONE'
                                : 'DONE'
                            : 'GET',
                        isActive: list.contains('5')
                            ? day == '5'
                                ? 1
                                : 1
                            : dayInt == 5
                                ? 2
                                : 3,
                        onTap: dayInt == 5
                            ? () async {
                                setState(() {
                                  day = '5';
                                });
                                coin = coin + 250;
                                dymond = dymond + 2;
                                await SavedData.setCoin(coin);
                                await SavedData.setDymond(dymond);
                                list.add(day);
                                await SavedData.setDailyListChek(list);
                              }
                            : () {},
                      ),
                      WidgetDaily(
                        image: AppImages.day6,
                        text: list.contains('6')
                            ? day == '6'
                                ? 'DONE'
                                : 'DONE'
                            : 'GET',
                        isActive: list.contains('6')
                            ? day == '6'
                                ? 1
                                : 1
                            : dayInt == 6
                                ? 2
                                : 3,
                        onTap: dayInt == 6
                            ? () async {
                                setState(() {
                                  day = '6';
                                });
                                coin = coin + 350;
                                await SavedData.setCoin(coin);
                                list.add(day);
                                await SavedData.setDailyListChek(list);
                              }
                            : () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  WidgetDaily(
                    width: getWidth(context),
                    image: AppImages.day7,
                    text: list.contains('7')
                        ? day == '7'
                            ? 'DONE'
                            : 'DONE'
                        : 'GET',
                    isActive: list.contains('7')
                        ? day == '7'
                            ? 1
                            : 1
                        : dayInt == 7
                            ? 2
                            : 3,
                    onTap: dayInt == 7
                        ? () async {
                            setState(() {
                              day = '7';
                            });
                            coin = coin + 500;
                            dymond = dymond + 5;
                            await SavedData.setCoin(coin);
                            await SavedData.setDymond(dymond);
                            list.add(day);
                            await SavedData.setDailyListChek(list);
                          }
                        : () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
