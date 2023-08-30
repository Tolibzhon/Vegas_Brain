import 'package:flutter/material.dart';
import 'package:vegas_brain_game/helpers/app_text_styles.dart';

class WidgetShop extends StatelessWidget {
  const WidgetShop(
      {super.key,
      required this.image,
      required this.text,
      required this.isActive,
      required this.onTap});
  final String image;
  final String text;
  final bool isActive;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      alignment: AlignmentDirectional.bottomCenter,
      width: 96,
      height: 124,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: AlignmentDirectional.center,
          width: 88,
          height: 24,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: isActive
                ? const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff2ADA46),
                      Color(0xff23780E),
                    ],
                  )
                : const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xffFFE158),
                      Color(0xffB5970F),
                    ],
                  ),
          ),
          child: Text(
            text,
            style: AppTextStyles.s14W600(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
