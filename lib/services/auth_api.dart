// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthApi {
  static final auth = FirebaseAuth.instance;

  static Future<bool> createUser(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }

  static Future<bool> signIn(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
      }
      debugPrint(e.toString());
      return false;
    }
  }

  static Future<bool> resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      return true;
    } on FirebaseAuthException {
      return false;
    }
  }

  static Future<bool> signOut() async {
    try {
      await auth.signOut();
      return true;
    } on FirebaseAuthException {
      return false;
    }
  }
}
