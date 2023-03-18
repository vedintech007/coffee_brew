import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ninja_brew_crew/screens/authenticate/register.dart';
import 'package:ninja_brew_crew/services/auth.dart';
import 'package:ninja_brew_crew/widgets/custom_buttons.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key, this.toggleView});

  final Function? toggleView;

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: const Text("Sign in to Brew Crew"),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: () {
              widget.toggleView!();
            },
            child: Row(
              children: const [
                Icon(Icons.person, color: Colors.black),
                SizedBox(
                  width: 3,
                ),
                Text(
                  "Register",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 50.0,
          ),
          child: Form(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  obscuringCharacter: "*",
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                ),
                const SizedBox(height: 20),
                CustomButton(
                  btnText: "Sign In",
                  btnTextStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  onBtnPress: () async {
                    // var response = await _authService.signInAnon();
                    print(email);
                    print(password);

                    // if (kDebugMode) {
                    //   if (response == null) {
                    //     print("Error signing in anon");
                    //   } else {
                    //     print("Successfully signed in");
                    //     print(response.uid);
                    //   }
                    // }
                  },
                ),
                // CustomButton(
                //   btnText: "Sign in anon",
                //   onBtnPress: () async {
                //     var response = await _authService.signInAnon();

                //     if (kDebugMode) {
                //       if (response == null) {
                //         print("Error signing in anon");
                //       } else {
                //         print("Successfully signed in");
                //         print(response.uid);
                //       }
                //     }
                //   },
                // ),
              ],
            ),
          )),
    );
  }
}
