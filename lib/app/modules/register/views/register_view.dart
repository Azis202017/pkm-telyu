import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../global/widgets/button_widgets.dart';
import '../../../global/widgets/input_widgets.dart';
import '../../../theme/color.dart';
import '../../../theme/font.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Container(
                  constraints: const BoxConstraints.expand(),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/15.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 48,
                      left: 16,
                      right: 16,
                    ),
                    width: double.infinity,
                    height: 696,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Masuk', style: headline4Bold),
                          const SizedBox(height: 29),
                          Text('Email', style: headline4Bold),
                          const SizedBox(height: 13),
                          InputWidget(
                            controller: controller.emailController,
                            hint: 'Masukkan email',
                          ),
                          const SizedBox(height: 21),
                          Text('Password', style: headline4Bold),
                          const SizedBox(height: 13),
                          InputWidget(
                            controller: controller.passwordController,
                            onTap: controller.visiblePassword,
                            isPassword: controller.isPassword,
                            hint: 'Masukkan password',
                            isVisibilityIcon: true,
                            icon: controller.icon,
                          ),
                          const SizedBox(
                            height: 69,
                          ),
                          ButtonWidgets(
                            text: 'Masuk',
                            background: primaryColor,
                            textStyle: buttonLinkLBold,
                            onPressed: () {},
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ButtonWidgets(
                            text: 'Masuk dengan google',
                            icon: 'assets/images/google.png',
                            widthIcon: 24,
                            heightIcon: 24,
                            textColor: Colors.black,
                            textStyle: buttonLinkLBold.copyWith(
                              color: Colors.black,
                            ),
                            onPressed: () {},
                            background: borderColorInput,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: RichText(
                              text: TextSpan(
                                text: 'Sudah punya akun?',
                                style: textDescription,
                                children: [
                                  TextSpan(
                                    text: ' Login disini',
                                    style: textDescription.copyWith(
                                      color: primaryColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
