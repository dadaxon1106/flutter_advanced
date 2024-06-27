import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advance/screens/login_screen.dart';
import 'package:flutter_advance/screens/sign_in.dart';

class AuthService {
  static final _auth = FirebaseAuth.instance;

  static bool isLogged() {
    final User? firebaseUser = _auth.currentUser;
    return firebaseUser != null;
  }

  static Future<User?> signInUser(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    final User firebaseUser = _auth.currentUser!;
    return firebaseUser;
  }

  static Future<User?> signUpUser(
      String fullName, String email, String password) async {
    var userResult = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    User? user = userResult.user;
    return user;
  }

  static void logOut(BuildContext context) {
    _auth.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const SignInScreen()));
  }
}
