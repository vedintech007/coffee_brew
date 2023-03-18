import 'package:flutter/material.dart';
import 'package:ninja_brew_crew/services/auth.dart';
import 'package:ninja_brew_crew/widgets/custom_buttons.dart';

class Register extends StatefulWidget {
  const Register({super.key, this.toggleView});

  final Function? toggleView;

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: const Text("Sign up to Brew Crew"),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: () async {
              widget.toggleView!();
            },
            child: Row(
              children: const [
                Icon(Icons.person, color: Colors.black),
                SizedBox(
                  width: 3,
                ),
                Text(
                  "Sign In",
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
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                  validator: (email) => email!.isEmpty ? "Enter a valid email" : null,
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
                  validator: (password) => password!.length < 6 ? "Enter a password 6+ chars long" : null,
                ),
                const SizedBox(height: 20),
                CustomButton(
                  btnText: "Sign Up",
                  btnTextStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  onBtnPress: () async {
                    if (_formKey.currentState!.validate()) {
                      print(email);
                      print(password);
                      dynamic result = await _authService.registerWithEmailAndPassword(email, password);

                      if (result == null) {
                        setState(() => error = 'Please enter a valid email');
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
          )),
    );
  }
}
