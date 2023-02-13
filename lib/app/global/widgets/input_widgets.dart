import 'package:flutter/material.dart';

import '../../theme/color.dart';
import '../../theme/font.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? hint;
  final bool? isPassword;
  final String? icon;
  final bool? isVisibilityIcon;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  const InputWidget({
    super.key,
    this.controller,
    this.hint,
    this.isPassword = false,
    this.isVisibilityIcon = false,
    this.icon,
    this.onTap,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      obscureText: isPassword != false ? true : false,
      validator: validator,
      decoration: InputDecoration(
        border: InputBorder.none,
        enabled: true,
        hintText: hint,
        hintStyle: textPlaceholder,
        focusedErrorBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.red.shade300,
            width: 1,
          ),
        ), 
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.red.shade300,
            width: 1,
          ),
        ),
        errorStyle: errorTextStyle,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 13,
          horizontal: 13,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: borderColorInput,
            width: 1,
          ),
        ),
        suffixIconConstraints: const BoxConstraints(
          minHeight: 32,
          minWidth: 32,
        ),
        suffixIcon: Container(
          width: 32,
          height: 32,
          margin: const EdgeInsets.only(
            right: 24,
          ),
          child: InkWell(
            onTap: onTap,
            child: isVisibilityIcon != false
                ? icon == ''
                    ? const SizedBox()
                    : Image.asset(
                        icon!,
                      )
                : const SizedBox(),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: borderColorInput,
            width: 1,
          ),
        ),
      ),
    );
  }
}
