import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
class RegisterController extends GetxController {
  FirebaseAuth authInstance = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String icon = 'assets/images/show.png';
  bool isPassword = true;
  void visiblePassword() {
    isPassword = !isPassword;
    icon = isPassword == true
        ? 'assets/images/show.png'
        : 'assets/images/hide.png';
    update();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.text = "";
    passwordController.text = "";
    emailController.dispose();
    passwordController.dispose();
  }
}
