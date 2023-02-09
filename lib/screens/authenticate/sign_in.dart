import 'package:flutter/material.dart';
import 'package:ninja_brew_crew/services/auth.dart';
import 'package:ninja_brew_crew/widgets/custom_buttons.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: const Text("Sign in to brew crew"),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 50.0,
          ),
          child: CustomButton(
            btnText: "Sign in anon",
            onBtnPress: () async {
              var response = await _auth.signInAnon();

              if (response == null) {
                print("Error signing in anon");
              } else {
                print("Successfully signed in");
                print(response.uid);
              }
            },
          )),
    );
  }
}
