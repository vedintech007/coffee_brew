import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import 'package:ninja_brew_crew/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create a user obj based on firebase user
  UserModel? _userFromFirebaseUser(User? user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<UserModel?> get user => _auth.authStateChanges().map(_userFromFirebaseUser);

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
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = result.user;

      return _userFromFirebaseUser(user);
    } catch (e) {
      if (kDebugMode) {
        print("Sign In user error => $e");
      }
      return null;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = result.user;

      return _userFromFirebaseUser(user);
    } catch (e) {
      if (kDebugMode) {
        print("Register user error => $e");
      }
      return null;
    }
  }

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
