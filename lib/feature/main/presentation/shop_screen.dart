import 'package:flutter/material.dart';
import 'package:vegas_brain_game/feature/widgets/spaces.dart';
import 'package:vegas_brain_game/helpers/app_images.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

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
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 40),
                    Image.asset(AppImages.shopText, width: 92),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
