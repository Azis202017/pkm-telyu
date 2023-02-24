import 'package:flutter/material.dart';

class ButtonWidgets extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final double? height;
  final Color? background;
  final bool? isIconVisible;
  final double? widthIcon;
  final double? heightIcon;
  final Color? textColor;
  final TextStyle? textStyle;
  final double? radius;
  final String? icon;
  final double? width;
  final double? elevation;
  const ButtonWidgets({
    super.key,
    required this.text,
    this.onPressed,
    this.background,
    this.isIconVisible,
    this.icon,
    this.textColor,
    this.textStyle,
    this.widthIcon,
    this.heightIcon,
    this.height,
    this.radius,
    this.width,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 0),
          ),
          elevation: elevation ?? 0,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isIconVisible != false
                ? icon != null
                    ? Image.asset(
                        '$icon',
                        width: widthIcon,
                        height: heightIcon,
                      )
                    : const SizedBox()
                : const SizedBox(),
            isIconVisible != false
                ? const SizedBox(width: 12)
                : const SizedBox(),
            Text(text, style: textStyle),
          ],
        ),
      ),
    );
  }
}
