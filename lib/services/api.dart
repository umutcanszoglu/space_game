import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:space_game/models/user.dart';

class Api {
  static final firestore = FirebaseFirestore.instance;

  static void addUser(UserModel user) async {
    await firestore.collection("Users").add(user.toMap());
  }

  static Future<UserModel> getUser(String mail) async {
    final result = await firestore.collection("Users").where("email", isEqualTo: mail).get();
    return UserModel.fromMap(result.docs.first.data());
  }

  static void delete() async {
    await firestore.collection("Users").doc("aa").delete();
  }
}
