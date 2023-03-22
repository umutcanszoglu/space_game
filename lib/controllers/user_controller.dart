import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:space_game/const/const.dart';
import 'package:space_game/services/auth_api.dart';

class UserController extends GetxController {
  final fullName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final passwordConfirm = TextEditingController();

  final loginEmail = TextEditingController();
  final loginPassword = TextEditingController();

  @override
  void onClose() {
    fullName.dispose();
    email.dispose();
    password.dispose();
    passwordConfirm.dispose();
    loginEmail.dispose();
    loginPassword.dispose();

    super.onClose();
  }

  void addUser() async {
    final result = await AuthApi.createUser(email.text.trim(), password.text.trim());
    if (result == true) {
      Get.snackbar(
        "User Add",
        "Successful",
        snackPosition: SnackPosition.BOTTOM,
        colorText: moneyCircleColor,
        margin: const EdgeInsets.all(16),
        backgroundColor: cardTitleColor,
        duration: const Duration(seconds: 2),
      );
    } else {
      Get.snackbar(
        "User Add",
        "Fail",
        snackPosition: SnackPosition.BOTTOM,
        colorText: moneyCircleColor,
        margin: const EdgeInsets.all(16),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
      );
    }

    fullName.text = "";
    email.text = "";
    password.text = "";
  }

  void signIn() async {
    final result = await AuthApi.signIn(loginEmail.text.trim(), loginPassword.text.trim());
    debugPrint(result.toString());
    loginEmail.text = "";
    loginPassword.text = "";
  }
}
