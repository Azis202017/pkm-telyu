import 'package:flutter/material.dart';

class ButtonWidgets extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color? background;
  final bool? isIconVisible;
  final double? widthIcon;
  final double? heightIcon;
  final Color? textColor;
  final TextStyle? textStyle;
  final String? icon;
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
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 47,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            
          ),
          elevation: 0
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
