import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:space_game/models/game_save.dart';

class GameSaveApi {
  static final firestore = FirebaseFirestore.instance;

  static Future<bool> saveGame(GameSave save) async {
    try {
      await firestore.collection("saves").doc("a").set(save.toMap());
      return true;
    } catch (_) {
      return false;
    }
  }

  static Future<GameSave?> getSave() async {
    try {
      final result = await firestore.collection("saves").doc("a").get();
      if (result.data() != null) {
        return GameSave.fromMap(result.data()!);
      }
      return null;
    } catch (_) {
      return null;
    }
  }
}
