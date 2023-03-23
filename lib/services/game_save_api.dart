import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:space_game/models/game_save.dart';

class GameSaveApi {
  static final firestore = FirebaseFirestore.instance;

  static Future<bool> saveGame(String uid, GameSave save) async {
    try {
      await firestore.collection("saves").doc(uid).set(save.toMap());
      return true;
    } catch (_) {
      return false;
    }
  }

  static Future<GameSave?> getSave(String uid) async {
    try {
      final result = await firestore.collection("saves").doc(uid).get();
      return GameSave.fromMap(result.data()!);
    } catch (_) {
      //print(_);
      return null;
    }
  }
}
