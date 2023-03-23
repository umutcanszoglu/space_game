import 'package:get/get.dart';
import 'package:space_game/controllers/home_controller.dart';
import 'package:space_game/models/game_save.dart';
import 'package:space_game/services/game_save_api.dart';

class GameController extends GetxController {
  final homeController = Get.put(HomeController());
  void saveGame() {
    final save = GameSave(
      money: homeController.money.value,
      planetChanger: homeController.planetChanger.value,
      upgrades: homeController.upgrades,
      planetUpgrades: homeController.planetUpgrades,
    );
    GameSaveApi.saveGame(save);
  }

  Future<GameSave?> getSave() async {
    final result = await GameSaveApi.getSave();
    return result;
  }
}
