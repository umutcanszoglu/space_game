import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:space_game/const/const.dart';
import 'package:space_game/services/auth_api.dart';
import 'package:space_game/utils/helpers.dart';

class UserController extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();

  final loginEmail = TextEditingController();
  final loginPassword = TextEditingController();

  final resetEmail = TextEditingController();

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    loginEmail.dispose();
    loginPassword.dispose();
    resetEmail.dispose();

    super.onClose();
  }

  void addUser() async {
    final result = await AuthApi.createUser(email.text.trim(), password.text.trim());
    if (result) {
      Get.back();
      Helpers.snackbar("User Add", "Success", Colors.green);
    } else {
      Helpers.snackbar("User Add", "Failed", red);
    }

    email.text = "";
    password.text = "";
  }

  Future<bool> signIn() async {
    final result = await AuthApi.signIn(loginEmail.text.trim(), loginPassword.text.trim());
    debugPrint(result.toString());
    if (!result) {
      Helpers.snackbar("Login", "Failed", red);
    }
    loginPassword.text = "";
    return result;
  }

  void resetPassword() async {
    final result = await AuthApi.resetPassword(resetEmail.text.trim());
    if (result) {
      Get.back();
      Helpers.snackbar("Reset Password", "Success", Colors.green);
    } else {
      Helpers.snackbar("Reset Password", "Failed", red);
    }
  }
}
