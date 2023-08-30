import 'package:flutter/material.dart';
import 'package:vegas_brain_game/feature/widgets/spaces.dart';
import 'package:vegas_brain_game/helpers/app_colors.dart';
import 'package:vegas_brain_game/helpers/app_images.dart';
import 'package:vegas_brain_game/helpers/const.dart';
import 'package:vegas_brain_game/helpers/saved_data.dart';

class ModeScreen extends StatefulWidget {
  const ModeScreen({super.key});

  @override
  State<ModeScreen> createState() => _ModeScreenState();
}

class _ModeScreenState extends State<ModeScreen> {
  String numGameMode = '';
  @override
  void initState() {
    gameMode();
    super.initState();
  }

  Future<void> gameMode() async {
    String textSavedData = await SavedData.getGameMode();
    setState(() {
      numGameMode = textSavedData;
    });
  }

  Widget buildModeContainer(bool isActive, Color startColor, Color endColor,
      String imageAsset, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: getWidth(context),
        height: 64,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: isActive == false
                ? [startColor, endColor]
                : [AppColors.color5DA7FFBlue3, AppColors.color5DA7FFBlue3],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          border: Border.all(
            color: Colors.blue,
            width: 6,
          ),
        ),
        child: Center(
          child: Image.asset(
            imageAsset,
            width: 60,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: getHeight(context),
        width: getWidth(context),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.imageBg),
            fit: BoxFit.cover,
          ),
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
          child: Padding(
            padding: const EdgeInsets.all(34),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(AppImages.closeIcon, width: 40),
                    ),
                    const SizedBox(width: 23),
                    Image.asset(AppImages.modeText, height: 36),
                  ],
                ),
                const SizedBox(height: 30),
                buildModeContainer(
                  numGameMode == GameMode.x23,
                  Colors.yellow,
                  AppColors.colorFDD835Yellow,
                  AppImages.x23,
                  () async {
                    setState(() {
                      numGameMode = GameMode.x23;
                    });
                    await SavedData.setGameMode(numGameMode);
                  },
                ),
                const SizedBox(height: 16),
                buildModeContainer(
                  numGameMode == GameMode.x24,
                  AppColors.colorFDD835Yellow,
                  AppColors.colorYellow2,
                  AppImages.x24,
                  () async {
                    setState(() {
                      numGameMode = GameMode.x24;
                    });
                    await SavedData.setGameMode(numGameMode);
                  },
                ),
                const SizedBox(height: 16),
                buildModeContainer(
                  numGameMode == GameMode.x25,
                  AppColors.colorFDD835Yellow,
                  AppColors.colorYellow3,
                  AppImages.x25,
                  () async {
                    setState(() {
                      numGameMode = GameMode.x25;
                    });
                    await SavedData.setGameMode(numGameMode);
                  },
                ),
                const SizedBox(height: 16),
                buildModeContainer(
                  numGameMode == GameMode.x34,
                  AppColors.colorYellow35,
                  AppColors.colorYellow4,
                  AppImages.x34,
                  () async {
                    setState(() {
                      numGameMode = GameMode.x34;
                    });
                    await SavedData.setGameMode(numGameMode);
                  },
                ),
                const SizedBox(height: 16),
                buildModeContainer(
                  numGameMode == GameMode.x36,
                  AppColors.colorYellow5,
                  AppColors.colorYellow5,
                  AppImages.x36,
                  () async {
                    setState(() {
                      numGameMode = GameMode.x36;
                    });
                    await SavedData.setGameMode(numGameMode);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
