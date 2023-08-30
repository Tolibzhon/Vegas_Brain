import 'package:flutter/material.dart';
import 'package:vegas_brain_game/feature/main/presentation/widget/widget_shop.dart';
import 'package:vegas_brain_game/feature/widgets/spaces.dart';
import 'package:vegas_brain_game/feature/widgets/styled_toasts.dart';
import 'package:vegas_brain_game/helpers/app_images.dart';
import 'package:vegas_brain_game/helpers/saved_data.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  String text = '1';
  int dymond = 0;
  List<String> shopListChek = [];
  @override
  void initState() {
    super.initState();
    savedData();
  }

  Future<void> savedData() async {
    int dymondSavedData = await SavedData.getDymond();
    List<String> shopListChekSavedData = await SavedData.getShopListChek();
    setState(() {
      dymond = dymondSavedData;
      shopListChek = shopListChekSavedData;
    });
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
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WidgetShop(
                      image: AppImages.design1,
                      text: text == '1' ? 'SELECTED' : 'SELECT',
                      isActive: text == '1',
                      onTap: () {
                        setState(() {
                          text = '1';
                        });
                      },
                    ),
                    WidgetShop(
                      image: AppImages.design2,
                      text: text == '2' ? 'SELECTED' : 'SELECT',
                      isActive: text == '2',
                      onTap: () {
                        setState(() {
                          text = '2';
                        });
                      },
                    ),
                    WidgetShop(
                      image: AppImages.design3,
                      text: text == '3' ? 'SELECTED' : 'SELECT',
                      isActive: text == '3',
                      onTap: () {
                        setState(() {
                          text = '3';
                        });
                      },
                    ),
                  ],
                ),
                //////////////////////////////////
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WidgetShop(
                      image: AppImages.design4,
                      text: text == '4' ? 'SELECTED' : 'SELECT',
                      isActive: text == '4',
                      onTap: () {
                        setState(() {
                          text = '4';
                        });
                      },
                    ),
                    WidgetShop(
                      image: AppImages.design5,
                      text: text == '5' ? 'SELECTED' : 'SELECT',
                      isActive: text == '5',
                      onTap: () {
                        setState(() {
                          text = '5';
                        });
                      },
                    ),
                    WidgetShop(
                      image: AppImages.design6,
                      text: text == '6' ? 'SELECTED' : 'SELECT',
                      isActive: text == '6',
                      onTap: () {
                        setState(() {
                          text = '6';
                        });
                      },
                    ),
                  ],
                ),
                //////////////////////////////////
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WidgetShop(
                      image: AppImages.design7,
                      text: text == '7' ? 'SELECTED' : 'SELECT',
                      isActive: text == '7',
                      onTap: () {
                        setState(() {
                          text = '7';
                        });
                      },
                    ),
                    WidgetShop(
                      image: AppImages.design8,
                      text: text == '8' ? 'SELECTED' : 'SELECT',
                      isActive: text == '8',
                      onTap: () {
                        setState(() {
                          text = '8';
                        });
                      },
                    ),
                    WidgetShop(
                      image: AppImages.design9,
                      text: text == '9' ? 'SELECTED' : 'SELECT',
                      isActive: text == '9',
                      onTap: () {
                        setState(() {
                          text = '9';
                        });
                      },
                    ),
                  ],
                ),
                //////////////////////////////////
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WidgetShop(
                      image: AppImages.design10,
                      text: text == '10' ? 'SELECTED' : 'SELECT',
                      isActive: text == '10',
                      onTap: () {
                        setState(() {
                          text = '10';
                        });
                      },
                    ),
                    WidgetShop(
                      image: AppImages.design11,
                      text: text == '11' ? 'SELECTED' : 'SELECT',
                      isActive: text == '11',
                      onTap: () {
                        setState(() {
                          text = '11';
                        });
                      },
                    ),
                    WidgetShop(
                      image: AppImages.design12,
                      text: text == '12' ? 'SELECTED' : 'SELECT',
                      isActive: text == '12',
                      onTap: () async {
                        setState(() {
                          text = '12';
                        });
                        dymond = dymond - 25;
                        if (dymond < 0) {
                          showErrorSnackBar("You don't have enough money");
                        } else {
                          await SavedData.setDymond(dymond);
                          shopListChek.add('12');
                          await SavedData.setShopListChek(shopListChek);
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
