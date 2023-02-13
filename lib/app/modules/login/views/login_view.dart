import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:pakas/app/theme/color.dart';
import 'package:pakas/app/theme/font.dart';

import '../../../global/widgets/button_widgets.dart';
import '../../../global/widgets/input_widgets.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
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
                            height: 13,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              'Reset Password',
                              textAlign: TextAlign.end,
                              style: textPlaceholder.copyWith(
                                color: primaryColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 69,
                          ),
                          ButtonWidgets(
                            text: 'Masuk',
                            background: primaryColor,
                            textStyle: buttonLinkLBold,
                            onPressed: () {
                              controller.loginUser(
                                email: controller.emailController.text,
                                password: controller.passwordController.text,
                              );
                             
                            },
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
                            isIconVisible: false,
                            textStyle: buttonLinkLBold.copyWith(
                              color: Colors.black,
                            ),
                            onPressed: controller.loginUserWithGoogle,
                            background: borderColorInput,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: controller.toRegisterPage,
                            child: Center(
                              child: RichText(
                                text: TextSpan(
                                  text: 'Tidak punya akun?',
                                  style: textDescription,
                                  children: [
                                    TextSpan(
                                      text: ' Daftar disini',
                                      style: textDescription.copyWith(
                                        color: primaryColor,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
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
