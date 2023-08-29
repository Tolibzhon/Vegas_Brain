import 'package:apphud/apphud.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegas_brain_game/config/app_url.dart';
import 'package:vegas_brain_game/config/premium.dart';
import 'package:vegas_brain_game/config/web_view_screen.dart';
import 'package:vegas_brain_game/feature/auth/premium_screen.dart';
import 'package:vegas_brain_game/feature/widgets/spaces.dart';
import 'package:vegas_brain_game/helpers/app_images.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(AppImages.closeIcon, width: 40),
                ),
                Image.asset(AppImages.settingsText, height: 36),
                const SizedBox(width: 40),
              ],
            ),
            const SizedBox(height: 30),
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
              child: Image.asset(AppImages.privacy, height: 64),
            ),
            const SizedBox(height: 16),
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
              child: Image.asset(AppImages.terms, height: 64),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WebViewScreen(
                      url: AppUrl.supportForm,
                      title: "Support",
                    ),
                  ),
                );
              },
              child: Image.asset(AppImages.support, height: 64),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () {},
              child: Image.asset(AppImages.rate, height: 64),
            ),
            const SizedBox(height: 16),
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
                    builder: (BuildContext context) => CupertinoAlertDialog(
                      title: const Text('Success!'),
                      content: const Text('Your purchase has been restored!'),
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
                    builder: (BuildContext context) => CupertinoAlertDialog(
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
              child: Image.asset(AppImages.restore, height: 64),
            ),
            const SizedBox(height: 16),
            FutureBuilder(
              future: Premium.getSubscrp(),
              builder: (context, AsyncSnapshot<bool?> snapshot) {
                if (snapshot.hasData) {
                  if (!snapshot.data!) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PremiumScreen(
                              isPop: true,
                            ),
                          ),
                        );
                      },
                      child: Image.asset(AppImages.premiumButton, height: 64),
                    );
                  }
                }
                return const SizedBox();
              },
            ),
          ],
        )),
      ),
    );
  }
}
