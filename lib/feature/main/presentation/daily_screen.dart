import 'package:flutter/material.dart';
import 'package:vegas_brain_game/feature/main/presentation/widget/widget_daily.dart';
import 'package:vegas_brain_game/feature/widgets/spaces.dart';
import 'package:vegas_brain_game/helpers/app_images.dart';

class DailyScreen extends StatefulWidget {
  const DailyScreen({super.key});

  @override
  State<DailyScreen> createState() => _DailyScreenState();
}

class _DailyScreenState extends State<DailyScreen> {
  String day = '1';
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
                      text: day == '1' ? 'DONE' : 'GET',
                      isActive: day == '1',
                      onTap: () {
                        setState(() {
                          day = '1';
                        });
                      },
                    ),
                    WidgetDaily(
                      image: AppImages.day2,
                      text: day == '2' ? 'DONE' : 'GET',
                      isActive: day == '2',
                      onTap: () {
                        setState(() {
                          day = '2';
                        });
                      },
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
                      text: day == '3' ? 'DONE' : 'GET',
                      isActive: day == '3',
                      onTap: () {
                        setState(() {
                          day = '3';
                        });
                      },
                    ),
                    WidgetDaily(
                      image: AppImages.day4,
                      text: day == '4' ? 'DONE' : 'GET',
                      isActive: day == '4',
                      onTap: () {
                        setState(() {
                          day = '4';
                        });
                      },
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
                      text: day == '5' ? 'DONE' : 'GET',
                      isActive: day == '5',
                      onTap: () {
                        setState(() {
                          day = '5';
                        });
                      },
                    ),
                    WidgetDaily(
                      image: AppImages.day6,
                      text: day == '6' ? 'DONE' : 'GET',
                      isActive: day == '6',
                      onTap: () {
                        setState(() {
                          day = '6';
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                WidgetDaily(
                  width: getWidth(context),
                  image: AppImages.day7,
                  text: day == '7' ? 'DONE' : 'GET',
                  isActive: day == '7',
                  onTap: () {
                    setState(() {
                      day = '7';
                    });
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
