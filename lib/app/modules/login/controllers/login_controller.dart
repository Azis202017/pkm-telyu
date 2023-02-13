import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pakas/app/routes/app_pages.dart';

class LoginController extends GetxController {
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

  Future<void> loginUser(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar('Login Berhasil', 'Anda telah berhasil login');
      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
          'User tidak ditemukan',
          'User tidak ditemukan mohon untuk melakukan registrasi',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          'Password salah ',
          'Password yang anda ketikkan salah mohon masukan password dengan benar',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailController.text = "";
    passwordController.text = "";
    emailController.dispose();
    passwordController.dispose();
  }

  void toRegisterPage() {
    Get.toNamed(Routes.REGISTER);
  }
}
