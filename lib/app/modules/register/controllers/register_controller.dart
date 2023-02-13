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

  Future<void> registerUser(
      {required String email, required String password}) async {
    try {
      await authInstance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar(
        'Berhasil Daftar',
        'Daftar Berhasil',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        Get.snackbar(
          'Password lemah',
          'Password kamu terlalu lemah coba masukin password lagi',
          backgroundColor: Colors.red.shade300,
          colorText: Colors.white,
      );
      } else if (e.code == "email-already-in-use") {
        Get.snackbar(
          'Email sudah terdaftar',
          'Coba ganti email yang lain..',
          backgroundColor: Colors.red.shade300,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print(e);
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
}
