import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pakas/app/routes/app_pages.dart';
import '../controllers/splash_screen_controller.dart';
import '../../../theme/color.dart';
import '../../../theme/font.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashScreenController>(
        init: SplashScreenController(),
        initState: (_) {
          controller.timer = Timer.periodic(const Duration(seconds: 2), (_) {
            Get.offAndToNamed(Routes.LOGIN);
            controller.timer!.cancel();
          });
        },
        builder: (_) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Image.asset(
                  'assets/images/background.png',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      width: 283,
                      height: 283,
                    ),
                    Text(
                      'ThriftMee',
                      style: headline1Bold.copyWith(
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
