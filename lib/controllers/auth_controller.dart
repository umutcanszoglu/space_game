import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
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

  Future<void> signInWithGoogle() async {
    EasyLoading.show(maskType: EasyLoadingMaskType.clear);

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (err) {
      if (err.code != "unknown") Helpers.snackbar("error".tr, err.code.tr, Colors.red);

      rethrow;
    } catch (_) {
      rethrow;
    }
    EasyLoading.dismiss();
  }
}