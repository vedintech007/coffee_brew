import 'package:firebase_auth/firebase_auth.dart';
import "package:firebase_core/firebase_core.dart";

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // sign in anonymously
  Future signInAnon() async {
    try {
      final result = await _auth.signInAnonymously();
      final user = result.user;

      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password

  // register with email and password

  // sign out
}
