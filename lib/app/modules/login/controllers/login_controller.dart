
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
    icon = isPassword == true ? 'assets/images/show.png' :'assets/images/hide.png';
    update();
  }
  Future<void> addUser(
      {required String email, required String password}) async {
    try {
      await authInstance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        print('The password provided is to weak');
      } else if (e.code == "email-already-in-use") {
        print('The account already exists for email');
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

  void toRegisterPage() {
    Get.toNamed(Routes.REGISTER);
  }
}