import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:space_game/const/const.dart';
import 'package:space_game/screens/game_page.dart';
import 'package:space_game/services/auth_api.dart';

class UserController extends GetxController {
  final fullName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final passwordConfirm = TextEditingController();

  final loginEmail = TextEditingController();
  final loginPassword = TextEditingController();

  final resetEmail = TextEditingController();

  @override
  void onClose() {
    fullName.dispose();
    email.dispose();
    password.dispose();
    passwordConfirm.dispose();
    loginEmail.dispose();
    loginPassword.dispose();
    resetEmail.dispose();

    super.onClose();
  }

  void addUser() async {
    final result = await AuthApi.createUser(email.text.trim(), password.text.trim());
    if (result) {
      Get.back();
      snackbar("User Add", "Success", Colors.green);
    } else {
      snackbar("User Add", "Failed", red);
    }

    fullName.text = "";
    email.text = "";
    password.text = "";
  }

  Future<bool> signIn() async {
    final result = await AuthApi.signIn(loginEmail.text.trim(), loginPassword.text.trim());
    debugPrint(result.toString());
    if (result) {
      Get.off(const GamePage());
    } else {
      snackbar("Login", "Failed", red);
    }
    loginEmail.text = "";
    loginPassword.text = "";
    return result;
  }

  void resetPassword() async {
    final result = await AuthApi.resetPassword(resetEmail.text.trim());
    if (result) {
      Get.back();
      snackbar("Reset Password", "Success", Colors.green);
    } else {
      snackbar("Reset Password", "Failed", red);
    }
  }

  void snackbar(String title, String msg, Color color) {
    Get.snackbar(
      title,
      msg,
      snackPosition: SnackPosition.BOTTOM,
      colorText: moneyCircleColor,
      margin: const EdgeInsets.all(20),
      backgroundColor: color,
      duration: const Duration(seconds: 2),
    );
  }
}
