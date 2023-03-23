import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:space_game/controllers/home_controller.dart';
import 'package:space_game/models/user.dart';
import 'package:space_game/services/auth_api.dart';
import 'package:space_game/utils/helpers.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final user = Rxn<User>();
  final profile = Rxn<ProfileModel>();

  final isLoading = true.obs;

  @override
  void onInit() {
    user.bindStream(_auth.authStateChanges());
    ever(user, (_) async {
      if (user.value == null) {
        profile.value = null;
        isLoading.value = false;
        profile.refresh();
        return;
      }

      profile.value = ProfileModel(
        uid: user.value!.uid,
        name: user.value!.displayName ?? "",
        email: user.value!.email ?? "",
      );

      isLoading.value = false;
    });

    super.onInit();
  }

  void logOut() async {
    final res = await AuthApi.signOut();
    if (res) {
      Helpers.snackbar("Sign Out", "Success", Colors.green);
      Get.delete<HomeController>();
    } else {
      Helpers.snackbar("Sign Out", "Failed", Colors.red);
    }
  }
}
