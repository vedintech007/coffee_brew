import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:ninja_brew_crew/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create a user obj based on firebase user
  UserModel _userFromFirebaseUser(User? user) {
    return UserModel(uid: user!.uid);
  }

  // auth change user stream
  Stream<UserModel> get user => _auth.authStateChanges().map(_userFromFirebaseUser);

  // sign in anonymously
  Future signInAnon() async {
    try {
      final result = await _auth.signInAnonymously();
      final user = result.user;

      return _userFromFirebaseUser(user!);
    } catch (e) {
      if (kDebugMode) {
        print("Sign in anon error => $e");
      }
      return null;
    }
  }

  // sign in with email and password

  // register with email and password

  // sign out
  Future signOut() async {
    try {
      print("signed out");
      return await _auth.signOut();
    } catch (e) {
      if (kDebugMode) {
        print("Sign out error => $e");
      }
      return null;
    }
  }
}
