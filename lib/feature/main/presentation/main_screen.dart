import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:vegas_brain_game/config/premium.dart';
import 'package:vegas_brain_game/feature/auth/premium_screen.dart';
import 'package:vegas_brain_game/feature/main/presentation/daily_screen.dart';
import 'package:vegas_brain_game/feature/main/presentation/mode_screen.dart';
import 'package:vegas_brain_game/feature/main/presentation/shop_screen.dart';
import 'package:vegas_brain_game/feature/settings/presentation/settings_screen.dart';
import 'package:vegas_brain_game/feature/widgets/spaces.dart';
import 'package:vegas_brain_game/feature/widgets/styled_toasts.dart';
import 'package:vegas_brain_game/helpers/app_images.dart';
import 'package:vegas_brain_game/helpers/app_text_styles.dart';
import 'package:vegas_brain_game/helpers/const.dart';
import 'package:vegas_brain_game/helpers/saved_data.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController pageController;
  int pageIndex = 0;
  bool _chek = false;
  int _quest = 0;
  bool _isBuy = false;
  bool _isTime = false;
  bool _isAttem = false;
  int dymond = 0;
  int coint = 0;

  List<String> listImage = [
    AppImages.imageMain,
    AppImages.imageTime,
    AppImages.imageAttempts,
    AppImages.imageTwoPlayer,
    AppImages.imageTournament,
  ];
  List<String> listImageLock = [
    AppImages.imageMain,
    AppImages.imageTimeLock,
    AppImages.imageAttemptsLock,
    AppImages.imageTwoPlayerLock,
    AppImages.imageTournamentLock,
  ];

  @override
  void initState() {
    pageController = PageController(viewportFraction: 0.8);
    super.initState();
    _quests();
  }

  Future<void> _quests() async {
    int questSavedData = await SavedData.getQuest();
    bool isBuy = await Premium.getSubscrp();
    bool isTime = await SavedData.getTime();
    bool isAttem = await SavedData.getAttempts();
    int dymondSavedData = await SavedData.getDymond();
    int cointSavedData = await SavedData.getCoin();

    setState(() {
      _quest = questSavedData;
      _isBuy = isBuy;
      _isTime = isTime;
      _isAttem = isAttem;
      dymond = dymondSavedData;
      coint = cointSavedData;
    });
    if (_quest > 20) {
      _quest = 0;
      await SavedData.setQuest(_quest);
    }
  }

  String getImagePath(int index) {
    if (!_isBuy && index > 2) {
      return listImageLock[index];
    } else if (!_isTime && index == 1) {
      return listImageLock[index];
    } else if (!_isAttem && index == 2) {
      return listImageLock[index];
    } else {
      return listImage[index];
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Image.asset(AppImages.coinContainer, height: 40),
                      Positioned(
                        right: 8,
                        child: FutureBuilder(
                            future: SavedData.getCoin(),
                            builder: (context, data) {
                              return Text(
                                '${data.data}',
                                style:
                                    AppTextStyles.s24W600(color: Colors.white),
                              );
                            }),
                      )
                    ],
                  ),
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Image.asset(AppImages.dymondConatiner, height: 40),
                      Positioned(
                        right: 8,
                        child: FutureBuilder(
                            future: SavedData.getDymond(),
                            builder: (context, data) {
                              return Text(
                                '${data.data}',
                                style:
                                    AppTextStyles.s24W600(color: Colors.white),
                              );
                            }),
                      )
                    ],
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingsScreen(),
                          ),
                        );
                      },
                      child: Image.asset(
                        AppImages.settingsIcon,
                        height: 40,
                      )),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DailyScreen()));
                      setState(() {});
                    },
                    child: Image.asset(AppImages.imageDaily, height: 80),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ShopScreen()));
                    },
                    child: Image.asset(AppImages.imageShop, height: 80),
                  ),
                ],
              ),
            ),
            /////////////////////////////////////
            const SizedBox(height: 16),
            Stack(
              children: [
                Image.asset(
                  AppImages.imageQuest,
                  height: 80,
                ),
                Positioned(
                  top: 20,
                  right: 12,
                  child: LinearPercentIndicator(
                    width: 190,
                    alignment: MainAxisAlignment.start,
                    barRadius: const Radius.circular(6),
                    lineHeight: 16.0,
                    percent: (_quest / 20),
                    backgroundColor: const Color(0xff147036),
                    progressColor: const Color(0xffF6A136),
                  ),
                ),
              ],
            ),
            ////////////////////////////////////////////////////////////////
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                controller: pageController,
                itemCount: listImage.length,
                onPageChanged: ((value) => setState(() => pageIndex = value)),
                itemBuilder: (context, int index) {
                  if (pageIndex == index) {
                    _chek = true;
                  } else {
                    _chek = false;
                  }
                  return AnimatedPadding(
                    duration: const Duration(milliseconds: 300),
                    padding: EdgeInsets.symmetric(
                      vertical: _chek ? 50 : 0,
                      horizontal: 0,
                    ),
                    child: InkWell(
                      onTap: () async {
                        if (index == 0) {
                          await SavedData.setGameSimply(GameSimply.norm);
                        } else if (index == 1) {
                          await SavedData.setGameSimply(GameSimply.time);
                        } else if (index == 2) {
                          await SavedData.setGameSimply(
                              GameSimply.gameAttempts);
                        } else if (index == 3) {
                          await SavedData.setGameSimply(GameSimply.twoPlayer);
                        } else if (index == 4) {
                          await SavedData.setGameSimply(GameSimply.tournament);
                        }
                        if (!_isBuy && index > 2) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PremiumScreen(
                                isPop: true,
                              ),
                            ),
                          );
                        } else if (!_isTime && index == 1) {
                          dymond = dymond - 100;
                          if (dymond < 0) {
                            showErrorSnackBar("You don't have enough diamonds");
                          } else {
                            await SavedData.setDymond(dymond);
                            await SavedData.setTime(true);
                            setState(() {
                              _isTime = true;
                            });
                          }
                        } else if (!_isAttem && index == 2) {
                          coint = coint - 5000;
                          if (coint < 0) {
                            showErrorSnackBar("You don't have enough coin");
                          } else {
                            await SavedData.setCoin(coint);
                            await SavedData.setAttempts(true);
                            setState(() {
                              _isAttem = true;
                            });
                          }
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ModeScreen(),
                            ),
                          );
                        }
                      },
                      child: Image.asset(
                        getImagePath(index),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: () async {
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DailyScreen()));
                  setState(() {});
                },
                child: Image.asset(
                  AppImages.bonusButton,
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
