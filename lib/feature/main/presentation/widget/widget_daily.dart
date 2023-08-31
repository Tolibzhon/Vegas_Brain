import 'package:flutter/material.dart';
import 'package:vegas_brain_game/helpers/app_text_styles.dart';

class WidgetDaily extends StatelessWidget {
  const WidgetDaily({
    super.key,
    required this.image,
    required this.text,
    required this.isActive,
    required this.onTap,
    this.width,
  });
  final String image;
  final String text;
  final int isActive;
  final Function() onTap;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      alignment: AlignmentDirectional.bottomCenter,
      width: width ?? 144,
      height: 144,
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
          width: 130,
          height: 36,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: isActive==1
                ? const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff2ADA46),
                      Color(0xff23780E),
                    ],
                  )
                :isActive==2
                ? const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xffFFE158),
                      Color(0xffB5970F),
                    ],
                  ):const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff909090),
                      Color(0xff606060),
                    ],
                  ),
          ),
          child: Text(
            text,
            style: AppTextStyles.s20W600(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
