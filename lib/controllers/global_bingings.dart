import 'package:get/get.dart';
import 'package:cosmic_clicker/controllers/auth_controller.dart';
import 'package:cosmic_clicker/controllers/tutorial_controller.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(TutorialController());
  }
}
