import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ninja_brew_crew/shared/constants.dart';
import 'package:ninja_brew_crew/screens/authenticate/register.dart';
import 'package:ninja_brew_crew/services/auth.dart';
import 'package:ninja_brew_crew/shared/custom_button.dart';
import 'package:ninja_brew_crew/widgets/custom_buttons.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key, this.toggleView});

  final Function? toggleView;

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';

  bool isLoading = false;

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
      body: isLoading
          ? showLoader()
          : Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 50.0,
              ),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      label: "Email",
                      hintText: "Enter your email address",
                      validator: (email) => email!.isEmpty ? "Enter a valid email" : null,
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      label: "Password",
                      hintText: "Enter your account password",
                      validator: (password) => password!.length < 6 ? "Enter a password 6+ chars long" : null,
                      obscureText: true,
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                    ),
                    const SizedBox(height: 100),
                    CustomButton(
                      btnText: "Sign In",
                      btnWidth: 200,
                      btnTextStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      onBtnPress: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() => isLoading = true);
                          dynamic result = await _authService.signInWithEmailAndPassword(email, password);

                          if (result == null) {
                            setState(() {
                              isLoading = false;
                              error = 'Invalid email or password.';
                            });
                          }
                        }
                      },
                    ),
                    const SizedBox(height: 12),
                    Text(
                      error,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
