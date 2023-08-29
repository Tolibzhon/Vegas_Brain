import 'package:flutter/material.dart';
import 'package:vegas_brain_game/feature/main/presentation/main_screen.dart';
import 'package:vegas_brain_game/feature/widgets/spaces.dart';
import 'package:vegas_brain_game/helpers/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () async {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const MainScreen(),
          ),
          (protected) => false,
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: getHeight(context),
        width: getWidth(context),
        decoration: const BoxDecoration(
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
        child: Center(
          child: Image.asset(
            AppImages.imageSplash,
            height: 200,
          ),
        ),
      ),
    );
  }
}
