import 'package:flutter/material.dart';
import 'package:vegas_brain_game/feature/main/presentation/main_screen.dart';
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
  int coint = 0;
  List<String> shopListChek = [];
  @override
  void initState() {
    super.initState();
    savedData();
  }

  Future<void> savedData() async {
    int dymondSavedData = await SavedData.getDymond();
    int cointSavedData = await SavedData.getCoin();
    List<String> shopListChekSavedData = await SavedData.getShopListChek();
    setState(() {
      dymond = dymondSavedData;
      coint = cointSavedData;
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
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainScreen(),
                          ),
                          (protected) => false,
                        );
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
                      onTap: () async {
                        setState(() {
                          text = '1';
                        });
                        await SavedData.setBgIndex(0);
                      },
                    ),
                    WidgetShop(
                      image: AppImages.design2,
                      text: text == '2' ? 'SELECTED' : 'SELECT',
                      isActive: text == '2',
                      onTap: () async{
                        setState(() {
                          text = '2';
                        });
                        await SavedData.setBgIndex(1);
                      },
                    ),
                    WidgetShop(
                      image: AppImages.design3,
                      text: shopListChek.contains('3')
                          ? text == '3'
                              ? 'SELECTED'
                              : 'SELECT'
                          : 'point',
                      isActive:
                          shopListChek.contains('3') ? text == '3' : false,
                      onTap: () async {
                        setState(() {
                          shopListChek.contains('3') ? text = '3' : null;
                        });
                        if (shopListChek.contains('3')) {
                           await SavedData.setBgIndex(2);
                        } else {
                          coint = coint - 999;
                          if (coint < 0) {
                            showErrorSnackBar("You don't have enough money");
                          } else {
                            await SavedData.setCoin(coint);
                            shopListChek.add('3');
                            await SavedData.setShopListChek(shopListChek);
                           
                          }
                        }
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
                      text: shopListChek.contains('4')
                          ? text == '4'
                              ? 'SELECTED'
                              : 'SELECT'
                          : 'point',
                      isActive:
                          shopListChek.contains('4') ? text == '4' : false,
                      onTap: () async {
                        setState(() {
                          shopListChek.contains('4') ? text = '4' : null;
                        });
                        if (shopListChek.contains('4')) {
                           await SavedData.setBgIndex(3);
                        } else {
                          coint = coint - 999;
                          if (coint < 0) {
                            showErrorSnackBar("You don't have enough money");
                          } else {
                            await SavedData.setCoin(coint);
                            shopListChek.add('4');
                            await SavedData.setShopListChek(shopListChek);
                           
                          }
                        }
                      },
                    ),
                    WidgetShop(
                      image: AppImages.design5,
                      text: shopListChek.contains('5')
                          ? text == '5'
                              ? 'SELECTED'
                              : 'SELECT'
                          : 'point',
                      isActive:
                          shopListChek.contains('5') ? text == '5' : false,
                      onTap: () async {
                        setState(() {
                          shopListChek.contains('5') ? text = '5' : null;
                        });
                        if (shopListChek.contains('5')) {
                           await SavedData.setBgIndex(4);
                        } else {
                          coint = coint - 999;
                          if (coint < 0) {
                            showErrorSnackBar("You don't have enough money");
                          } else {
                            await SavedData.setCoin(coint);
                            shopListChek.add('5');
                            await SavedData.setShopListChek(shopListChek);
                           
                          }
                        }
                      },
                    ),
                    WidgetShop(
                      image: AppImages.design6,
                      text: shopListChek.contains('6')
                          ? text == '6'
                              ? 'SELECTED'
                              : 'SELECT'
                          : 'point',
                      isActive:
                          shopListChek.contains('6') ? text == '6' : false,
                      onTap: () async {
                        setState(() {
                          shopListChek.contains('6') ? text = '6' : null;
                        });
                        if (shopListChek.contains('6')) {
                           await SavedData.setBgIndex(5);
                        } else {
                          coint = coint - 999;
                          if (coint < 0) {
                            showErrorSnackBar("You don't have enough money");
                          } else {
                            await SavedData.setCoin(coint);
                            shopListChek.add('6');
                            await SavedData.setShopListChek(shopListChek);
                           
                          }
                        }
                      },
                    )
                  ],
                ),
                //////////////////////////////////
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WidgetShop(
                      image: AppImages.design7,
                      text: shopListChek.contains('7')
                          ? text == '7'
                              ? 'SELECTED'
                              : 'SELECT'
                          : 'point',
                      isActive:
                          shopListChek.contains('7') ? text == '7' : false,
                      onTap: () async {
                        setState(() {
                          shopListChek.contains('7') ? text = '7' : null;
                        });
                        if (shopListChek.contains('7')) {
                          await SavedData.setBgIndex(6);
                        } else {
                          coint = coint - 999;
                          if (coint < 0) {
                            showErrorSnackBar("You don't have enough money");
                          } else {
                            await SavedData.setCoin(coint);
                            shopListChek.add('7');
                            await SavedData.setShopListChek(shopListChek);
                            
                          }
                        }
                      },
                    ),
                    WidgetShop(
                      image: AppImages.design8,
                      text: shopListChek.contains('8')
                          ? text == '8'
                              ? 'SELECTED'
                              : 'SELECT'
                          : 'point',
                      isActive:
                          shopListChek.contains('8') ? text == '8' : false,
                      onTap: () async {
                        setState(() {
                          shopListChek.contains('8') ? text = '8' : null;
                        });
                        if (shopListChek.contains('8')) {
                          await SavedData.setBgIndex(7);
                        } else {
                          coint = coint - 999;
                          if (coint < 0) {
                            showErrorSnackBar("You don't have enough money");
                          } else {
                            await SavedData.setCoin(coint);
                            shopListChek.add('8');
                            await SavedData.setShopListChek(shopListChek);
                            
                          }
                        }
                      },
                    ),
                    WidgetShop(
                      image: AppImages.design9,
                      text: shopListChek.contains('9')
                          ? text == '9'
                              ? 'SELECTED'
                              : 'SELECT'
                          : 'point',
                      isActive:
                          shopListChek.contains('9') ? text == '9' : false,
                      onTap: () async {
                        setState(() {
                          shopListChek.contains('9') ? text = '9' : null;
                        });
                        if (shopListChek.contains('9')) {
                          await SavedData.setBgIndex(8);
                        } else {
                          coint = coint - 999;
                          if (coint < 0) {
                            showErrorSnackBar("You don't have enough money");
                          } else {
                            await SavedData.setCoin(coint);
                            shopListChek.add('9');
                            await SavedData.setShopListChek(shopListChek);
                            
                          }
                        }
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
                      text: shopListChek.contains('10')
                          ? text == '10'
                              ? 'SELECTED'
                              : 'SELECT'
                          : 'dymond',
                      isActive:
                          shopListChek.contains('10') ? text == '10' : false,
                      onTap: () async {
                        setState(() {
                          shopListChek.contains('10') ? text = '10' : null;
                        });
                        if (shopListChek.contains('10')) {
                          await SavedData.setBgIndex(9);
                        } else {
                          dymond = dymond - 25;
                          if (dymond < 0) {
                            showErrorSnackBar("You don't have enough diamonds");
                          } else {
                            await SavedData.setDymond(dymond);
                            shopListChek.add('10');
                            await SavedData.setShopListChek(shopListChek);
                            
                          }
                        }
                      },
                    ),
                    WidgetShop(
                      image: AppImages.design11,
                      text: shopListChek.contains('11')
                          ? text == '11'
                              ? 'SELECTED'
                              : 'SELECT'
                          : 'dymond',
                      isActive:
                          shopListChek.contains('11') ? text == '11' : false,
                      onTap: () async {
                        setState(() {
                          shopListChek.contains('11') ? text = '11' : null;
                        });
                        if (shopListChek.contains('11')) {
                           await SavedData.setBgIndex(10);
                        } else {
                          dymond = dymond - 25;
                          if (dymond < 0) {
                            showErrorSnackBar("You don't have enough diamonds");
                          } else {
                            await SavedData.setDymond(dymond);
                            shopListChek.add('11');
                            await SavedData.setShopListChek(shopListChek);
                           
                          }
                        }
                      },
                    ),
                    WidgetShop(
                      image: AppImages.design12,
                      text: shopListChek.contains('12')
                          ? text == '12'
                              ? 'SELECTED'
                              : 'SELECT'
                          : 'dymond',
                      isActive:
                          shopListChek.contains('12') ? text == '12' : false,
                      onTap: () async {
                        setState(() {
                          shopListChek.contains('12') ? text = '12' : null;
                        });
                        if (shopListChek.contains('12')) {
                          await SavedData.setBgIndex(11);
                        } else {
                          dymond = dymond - 25;
                          if (dymond < 0) {
                            showErrorSnackBar("You don't have enough diamonds");
                          } else {
                            await SavedData.setDymond(dymond);
                            shopListChek.add('12');
                            await SavedData.setShopListChek(shopListChek);
                            
                          }
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
