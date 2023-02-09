import 'package:flutter/material.dart';
import 'package:ninja_brew_crew/screens/authenticate/authenticate.dart';
import 'package:ninja_brew_crew/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // return either home or authentice widget
    return StreamBuilder<Object>(
        stream: null,
        builder: (context, snapshot) {
          return Authenticate();
        });
  }
}
