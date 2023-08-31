import 'package:flutter/material.dart';
import 'package:vegas_brain_game/feature/main/presentation/main_screen.dart';
import 'package:vegas_brain_game/feature/widgets/spaces.dart';
import 'package:vegas_brain_game/helpers/app_colors.dart';
import 'package:vegas_brain_game/helpers/app_images.dart';
import 'package:vegas_brain_game/helpers/app_text_styles.dart';
import 'package:vegas_brain_game/helpers/const.dart';
import 'package:vegas_brain_game/helpers/saved_data.dart';

class WinScreen extends StatefulWidget {
  const WinScreen({super.key, this.coin});
  final int? coin;

  @override
  State<WinScreen> createState() => _WinScreenState();
}

class _WinScreenState extends State<WinScreen> {
  int player1 = 0;
  int player2 = 0;
  String textGameSimply = '';
  @override
  void initState() {
    super.initState();
    savedData();
  }

  Future<void> savedData() async {
    int player1SavedData = await SavedData.getPlayer1();
    int player2SavedData = await SavedData.getPlayer2();
    String textSavedData = await SavedData.getGameSimply();
    setState(() {
      player1 = player1SavedData;
      player2 = player2SavedData;
      textGameSimply = textSavedData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 400,
                child: Stack(alignment: AlignmentDirectional.center, children: [
                  Align(
                      alignment: AlignmentDirectional.bottomCenter,
                      child: Image.asset(AppImages.rectangleBac)),
                  Positioned(
                      top: -10,
                      child: Column(
                        children: [
                          Image.asset(AppImages.starsWin, width: 298),
                          const SizedBox(height: 32),
                          Image.asset(AppImages.youWin, width: 176),
                          const SizedBox(height: 32),
                          textGameSimply == GameSimply.twoPlayer
                              ? Text(
                                  player1 > player2
                                      ? 'Win Player 1!'
                                      : player1 < player2
                                          ? 'Win Player 2!'
                                          : 'Draw in the game!',
                                  style: AppTextStyles.s28W600(
                                      color: AppColors.white),
                                )
                              : Container(
                                  width: 244,
                                  height: 68,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(83),
                                      color: AppColors.color13235FBlue
                                          .withOpacity(0.6)),
                                  child: Column(
                                    children: [
                                      Text(
                                        'REWARDS',
                                        style: AppTextStyles.s16W400(
                                            color: AppColors.white),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        '${widget.coin}',
                                        style: AppTextStyles.s20W900(
                                            color: AppColors.white),
                                      ),
                                    ],
                                  ),
                                )
                        ],
                      )),
                ]),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainScreen(),
                    ),
                    (protected) => false,
                  );
                },
                child: Image.asset(
                  AppImages.homeButton,
                  width: 316,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
