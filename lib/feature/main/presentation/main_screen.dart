import 'package:flutter/material.dart';
import 'package:vegas_brain_game/feature/main/presentation/daily_screen.dart';
import 'package:vegas_brain_game/feature/main/presentation/shop_screen.dart';
import 'package:vegas_brain_game/feature/settings/presentation/settings_screen.dart';
import 'package:vegas_brain_game/feature/widgets/spaces.dart';
import 'package:vegas_brain_game/helpers/app_images.dart';
import 'package:vegas_brain_game/helpers/app_text_styles.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

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
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Image.asset(AppImages.coinContainer, height: 40),
                    Positioned(
                      right: 8,
                      child: Text(
                        '10690',
                        style: AppTextStyles.s24W600(color: Colors.white),
                      ),
                    )
                  ],
                ),
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Image.asset(AppImages.dymondConatiner, height: 40),
                    Positioned(
                      right: 8,
                      child: Text(
                        '25',
                        style: AppTextStyles.s24W600(color: Colors.white),
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
            const SizedBox(height: 30),
            Row(
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
            const Spacer(),
            Image.asset(AppImages.bonusButton),
          ],
        )),
      ),
    );
  }
}
