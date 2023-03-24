import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:space_game/const/const.dart';

class Helpers {
  static void snackbar(String title, String msg, Color color) {
    Get.snackbar(
      title,
      msg,
      snackPosition: SnackPosition.BOTTOM,
      colorText: moneyCircleColor,
      margin: const EdgeInsets.all(20),
      backgroundColor: color,
      duration: const Duration(milliseconds: 900),
    );
  }
}
