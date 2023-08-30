import 'package:flutter/material.dart';
import 'package:vegas_brain_game/feature/main/presentation/daily_screen.dart';
import 'package:vegas_brain_game/feature/main/presentation/mode_screen.dart';
import 'package:vegas_brain_game/feature/main/presentation/shop_screen.dart';
import 'package:vegas_brain_game/feature/settings/presentation/settings_screen.dart';
import 'package:vegas_brain_game/feature/widgets/spaces.dart';
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

  List<String> listImage = [
    AppImages.imageMain,
    AppImages.imageTime,
    AppImages.imageAttempts,
    AppImages.imageTwoPlayer,
    AppImages.imageTournament,
  ];

  @override
  void initState() {
    pageController = PageController(viewportFraction: 0.8);
    super.initState();
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
                              style: AppTextStyles.s24W600(color: Colors.white),
                            );
                          }
                        ),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DailyScreen()));
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
                      vertical: _chek ? 50 : 60,
                      horizontal: 2,
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ModeScreen(),
                          ),
                        );
                      },
                      child: Image.asset(
                        listImage[index],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset(
                AppImages.bonusButton,
              ),
            ),
          ],
        )),
      ),
    );
  }
}
