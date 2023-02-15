import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pakas/app/routes/app_pages.dart';

class LoginController extends GetxController {
  FirebaseAuth authInstance = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
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

  void loginUserWithGoogle() async {
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
        Get.offAllNamed(Routes.HOME);
      }
    } catch (error) {
      Get.snackbar('Terdapat error', '$error');
    }
  }

  void toRegisterPage() {
    Get.toNamed(Routes.REGISTER);
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
    } else if(value.length < 7) {
      return 'Mohon lebih dari 7 passwordnya';
    }
     else {
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
