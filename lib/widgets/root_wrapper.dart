import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cosmic_clicker/controllers/auth_controller.dart';
import 'package:cosmic_clicker/screens/game_page.dart';
import 'package:cosmic_clicker/screens/login_page.dart';

class RootWrapper extends GetView<AuthController> {
  const RootWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : Obx(() => controller.profile.value != null ? const GamePage() : const LoginPage()),
    );
  }
}
