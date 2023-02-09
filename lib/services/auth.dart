import 'package:firebase_auth/firebase_auth.dart';
import "package:firebase_core/firebase_core.dart";
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
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password

  // register with email and password

  // sign out
}
