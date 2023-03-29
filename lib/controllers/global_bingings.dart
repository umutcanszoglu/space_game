import 'package:get/get.dart';
import 'package:space_game/controllers/auth_controller.dart';
import 'package:space_game/controllers/tutorial_controller.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(TutorialController());
  }
}
