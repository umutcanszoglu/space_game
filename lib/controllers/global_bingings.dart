import 'package:get/get.dart';
import 'package:space_game/controllers/auth_controller.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
