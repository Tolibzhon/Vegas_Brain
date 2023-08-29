import 'package:apphud/apphud.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegas_brain_game/config/app_url.dart';
import 'package:vegas_brain_game/config/premium.dart';
import 'package:vegas_brain_game/config/web_view_screen.dart';
import 'package:vegas_brain_game/feature/main/presentation/main_screen.dart';
import 'package:vegas_brain_game/feature/widgets/spaces.dart';
import 'package:vegas_brain_game/helpers/app_colors.dart';
import 'package:vegas_brain_game/helpers/app_images.dart';
import 'package:vegas_brain_game/helpers/app_text_styles.dart';

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({super.key, this.isPop = false});
  final bool isPop;

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: getWidth(context),
        height: getHeight(context),
        padding: const EdgeInsets.symmetric(horizontal: 24),
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
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      if (widget.isPop) {
                        Navigator.pop(context);
                      } else {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainScreen(),
                          ),
                          (protected) => false,
                        );
                      }
                    },
                    child: Image.asset(AppImages.closeIcon, width: 40),
                  ),
                  Image.asset(AppImages.premiumText, height: 36),
                  const SizedBox(width: 40),
                ],
              ),
              const Spacer(),
              Center(
                  child: Image.asset(
                AppImages.imagePremium,
              )),
              const SizedBox(height: 16),
              Image.asset(AppImages.titlePremium),
              const Spacer(),
              InkWell(
                onTap: () async {
                  var paywalls = await Apphud.paywalls();
                  await Apphud.purchase(
                    product: paywalls?.paywalls.first.products!.first,
                  ).whenComplete(
                    () async {
                      if (await Apphud.hasActiveSubscription() ||
                          await Apphud.hasPremiumAccess()) {
                        await Premium.setSubscrp();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainScreen(),
                          ),
                          (route) => false,
                        );
                      }
                    },
                  );
                },
                child: Image.asset(AppImages.premiumButton),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WebViewScreen(
                            url: AppUrl.termOfUse,
                            title: "Term of Use",
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'TERMS OF SERVICE',
                      style: AppTextStyles.s12W900(color: AppColors.white),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      final hasPremiumAccess = await Apphud.hasPremiumAccess();
                      final hasActiveSubscription =
                          await Apphud.hasActiveSubscription();
                      if (hasPremiumAccess || hasActiveSubscription) {
                        final prefs = await SharedPreferences.getInstance();
                        prefs.setBool("ISBUY", true);
                        showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              CupertinoAlertDialog(
                            title: const Text('Success!'),
                            content:
                                const Text('Your purchase has been restored!'),
                            actions: [
                              CupertinoDialogAction(
                                isDefaultAction: true,
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.popUntil(
                                      context, (route) => route.isFirst);
                                },
                                child: const Text('Ok'),
                              ),
                            ],
                          ),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              CupertinoAlertDialog(
                            title: const Text('Restore purchase'),
                            content: const Text(
                                'Your purchase is not found.\nSupport: ${AppUrl.supportForm}'),
                            actions: [
                              CupertinoDialogAction(
                                isDefaultAction: true,
                                onPressed: () => {Navigator.of(context).pop()},
                                child: const Text('Ok'),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    child: Text(
                      'RESTORE',
                      style: AppTextStyles.s12W900(color: AppColors.white),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WebViewScreen(
                            url: AppUrl.privacyPolicy,
                            title: "Privacy Policy",
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'PRIVACY POLICY',
                      style: AppTextStyles.s12W900(color: AppColors.white),
                    ),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
