import 'package:flutter/material.dart';
import 'package:ninja_brew_crew/models/user.dart';
import 'package:ninja_brew_crew/screens/authenticate/authenticate.dart';
import 'package:ninja_brew_crew/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);

    print(user);
    // return either home or authentice widget
    return Authenticate();
  }
}
