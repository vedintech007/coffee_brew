import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:ninja_brew_crew/services/auth.dart';

final AuthService authService = AuthService();

borderStyling({Color? boderColor}) {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: boderColor ?? Colors.white,
      width: 2,
    ),
  );
}

showLoader() {
  return Center(
    child: LoadingAnimationWidget.threeArchedCircle(
      color: Colors.cyan,
      size: 38,
    ),
  );
}
