import 'package:flutter/material.dart';
import 'package:ninja_brew_crew/models/brew.dart';
import 'package:ninja_brew_crew/screens/home/brew_list.dart';
import 'package:ninja_brew_crew/screens/home/settings_form.dart';
import 'package:ninja_brew_crew/services/auth.dart';
import 'package:ninja_brew_crew/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final AuthService _authService = AuthService();

  void _showSettingsPanel(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: const SettingsForm(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Brew>?>(
      initialData: null,
      create: (context) => DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text("Brew Crew Home Page"),
          centerTitle: false,
          actions: [
            TextButton(
              onPressed: () async {
                await _authService.signOut();
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
            TextButton(
              onPressed: () => _showSettingsPanel(context),
              child: Row(
                children: const [
                  Icon(Icons.settings, color: Colors.black),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    "Settings",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/coffee_bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: const BrewList(),
          ),
        ),
      ),
    );
  }
}
