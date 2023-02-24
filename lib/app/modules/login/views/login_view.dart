import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:pakas/app/theme/color.dart';
import 'package:pakas/app/theme/font.dart';

import '../../../global/widgets/button_widgets.dart';
import '../../../theme/shadow.dart';
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
                Column(
                  children: [
                    const SizedBox(height: 30),
                    Center(
                      child: Text(
                        'ThriftMee',
                        style: headline1Bold.copyWith(
                          fontWeight: FontWeight.w800,
                          color: primaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 60),
                    Image.asset('assets/images/login.png'),
                    const SizedBox(height: 17),
                    Text(
                      'Bergabunglah bersama kami dalam mengurangi limbah kain di Bumi',
                      style: headline2Semi.copyWith(
                        color: primaryColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
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
                    height: 178,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      boxShadow: dropShadow,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ButtonWidgets(
                            text: 'Masuk dengan google',
                            icon: 'assets/images/google.png',
                            widthIcon: 24,
                            heightIcon: 24,
                            radius: 20,
                            height: 67,
                            textColor: Colors.black,
                            textStyle: buttonLinkLBold.copyWith(
                              color: Colors.white,
                            ),
                            onPressed: controller.loginUserWithGoogle,
                            background: primaryColor,
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
