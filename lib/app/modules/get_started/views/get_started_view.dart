import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pakas/app/theme/color.dart';
import 'package:pakas/app/theme/font.dart';

import '../../../global/widgets/button_widgets.dart';
import '../../../routes/app_pages.dart';
import '../controllers/get_started_controller.dart';

class GetStartedView extends GetView<GetStartedController> {
  const GetStartedView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF4F5FA),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 26),
              Center(
                child: Text(
                  'ThriftMee',
                  style: headline1Bold.copyWith(
                    color: primaryColor,
                  ),
                ),
              ),
              Image.asset(
                'assets/images/get_started.png',
                height: 450,
              ),
              Text(
                'Thrift mee menjual baju bekas berkualitas berstandar tinggi dan harga terjangkau',
                textAlign: TextAlign.center,
                style: headline4Bold.copyWith(
                  color: primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 46,
                  right: 45,
                  top: 47,
                ),
                child: ButtonWidgets(
                  text: 'Buat Akun',
                  height: 47,
                  radius: 20,
                  elevation:0.5,

                  background: primaryColor,
                  textStyle: buttonLinkLBold,
                  onPressed: () {
                    Get.toNamed(Routes.REGISTER);

                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 46,
                  right: 45,
                  top: 10,
                  
                ),
                child: ButtonWidgets(
                  text: 'Masuk ',
                  height: 47,
                  radius: 20,
                  elevation: 0.5,
                  background: Colors.white,
                  textStyle: buttonLinkLBold.copyWith(
                    color: primaryColor,
                  ),
                  onPressed: () {
                    Get.toNamed(Routes.LOGIN);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
