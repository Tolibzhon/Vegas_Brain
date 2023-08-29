import 'package:flutter/material.dart';
import 'package:vegas_brain_game/feature/widgets/app_indicator.dart';
import 'package:vegas_brain_game/helpers/app_colors.dart';
import 'package:vegas_brain_game/helpers/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.color,
    this.textColor,
    this.height,
    this.isLoading = false,
    this.width,
    this.radius = 20,
    this.isGradient = false,
    this.icon,
    this.style,
  }) : super(key: key);
  final String text;
  final String? icon;
  final GestureTapCallback? onPressed;
  final Color? color;
  final Color? textColor;
  final double? height;
  final double? width;
  final bool isLoading;
  final double radius;
  final bool isGradient;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? null : onPressed,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: !isGradient ? color ?? AppColors.grey : null,
          gradient: isGradient
              ? const LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Color(0xff54C7F9),
                    Color(0xff2A8BDA),
                  ],
                )
              : null,
        ),
        height: height ?? 56,
        width: width ?? MediaQuery.of(context).size.width,
        child: isLoading
            ? const AppIndicator(color: Colors.white)
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon != null
                      ? Image.asset(
                          icon!,
                          width: 20,
                        )
                      : const SizedBox(),
                  SizedBox(width: icon != null ? 12 : 0),
                  Text(
                    text,
                    style: style ??
                        AppTextStyles.s19W700(
                          color: textColor ?? Colors.white,
                        ),
                  ),
                ],
              ),
      ),
    );
  }
}
