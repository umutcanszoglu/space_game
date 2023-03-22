import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:space_game/models/game_save.dart';

class GameSaveApi {
  static final firestore = FirebaseFirestore.instance;

  static void addUser(GameSave save) async {
    await firestore.collection("Users").add(save.toMap());
  }
}
