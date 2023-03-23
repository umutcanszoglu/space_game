import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:space_game/models/user.dart';

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
}
