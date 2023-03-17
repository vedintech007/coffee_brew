import 'package:flutter/material.dart';
import 'package:ninja_brew_crew/screens/authenticate/sign_in.dart';
import 'package:ninja_brew_crew/services/auth.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: const Text("Brew Crew Home Page"),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: () async {
              await _authService.signOut();
              MaterialPageRoute(
                builder: (context) => const SignIn(),
              );
            },
            child: Row(
              children: const [
                Icon(Icons.person, color: Colors.black),
                SizedBox(
                  width: 3,
                ),
                Text(
                  "Logout",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: const Text("Home"),
        ),
      ),
    );
  }
}
