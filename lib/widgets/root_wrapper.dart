import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:space_game/controllers/auth_controller.dart';
import 'package:space_game/screens/game_page.dart';
import 'package:space_game/screens/login_page.dart';

class RootWrapper extends GetView<AuthController> {
  const RootWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : controller.profile.value != null
              ? const GamePage()
              : const LoginPage(),
    );
  }
}
