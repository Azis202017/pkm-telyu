import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class RegisterController extends GetxController {
  FirebaseAuth authInstance = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
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
      Get.snackbar('Terdapat error', '$e');
    }
  }

  void registrasiUserWithGoogle() async {
    try {
      _googleSignIn.signOut();
      final GoogleSignInAccount? currentUser = await _googleSignIn.signIn();
      final isLogin = await _googleSignIn.isSignedIn();
      if (isLogin) {
        final GoogleSignInAuthentication? googleAuth =
            await currentUser?.authentication;
        final credential = GoogleAuthProvider.credential(
          idToken: googleAuth!.idToken,
          accessToken: googleAuth.accessToken,
        );

        await authInstance.signInWithCredential(credential);
        Get.back();
      }
    } catch (error) {
      Get.snackbar('Terdapat error', '$error');
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

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Mohon isi terlebih dahulu';
    } else if (value.length < 7) {
      return 'Mohon lebih dari 7 passwordnya';
    } else {
      return null;
    }
  }

  String? validateEmail(String? value) {
    if (!value!.contains('@')) {
      return 'Mohon terdapat @ pada inputan';
    } else {
      return null;
    }
  }
}
