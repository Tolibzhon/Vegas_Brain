import 'package:flutter/material.dart';
import 'package:vegas_brain_game/feature/widgets/spaces.dart';
import 'package:vegas_brain_game/helpers/app_colors.dart';
import 'package:vegas_brain_game/helpers/app_text_styles.dart';
import 'package:vegas_brain_game/main.dart';

void showErrorSnackBar(String error) {
  scaffoldKey.currentState?.showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 2),
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFFF1100),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          error,
          textAlign: TextAlign.center,
          style: AppTextStyles.s15W400(color: Colors.white),
        ),
      ),
    ),
  );
}

void showSuccessSnackBar(String text) {
  scaffoldKey.currentState?.showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 2),
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF026405),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: AppTextStyles.s15W400(color: Colors.white),
        ),
      ),
    ),
  );
}

Future<void> useShowDialog(
  BuildContext context,
) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            const SizedBox(height: 460),
            Container(
              width: getWidth(context),
              height: 450,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: AppColors.color13235FBlue,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: AppColors.colorLightBlue,
                  width: 3,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HOW TO USE',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.s36W900(color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Start the game by clicking on any of the cards. The card will open and you will see the image, icon or text on that card.\n\nThen select the second card you want to open. Cards can only be opened in pairs per turn.\n\nIf both opened cards have the same image, icon or text, they remain open and you get points for a correct match. You also get the opportunity to open two more cards.\n\nIf the cards do not match, they are automatically closed back.',
                    style: AppTextStyles.s16W600(color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                // child: Image.asset(AppImages.closeIconRed, width: 40),
              ),
            ),
          ],
        ),
      );
    },
  );
}
