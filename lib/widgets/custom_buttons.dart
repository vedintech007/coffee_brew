import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.btnText,
    this.btnWidth,
    this.btnHeight,
    this.borderRaduis,
    this.btnBackgroundColor,
    this.btnTextStyle,
    required this.onBtnPress,
    this.shape,
  }) : super(key: key);

  final String btnText;
  final double? btnWidth;
  final double? btnHeight;
  final double? borderRaduis;
  final Color? btnBackgroundColor;
  final TextStyle? btnTextStyle;
  final Function onBtnPress;
  final OutlinedBorder? shape;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onBtnPress();
      },
      style: ElevatedButton.styleFrom(
        fixedSize: Size(btnWidth ?? MediaQuery.of(context).size.width / 0.5, btnHeight ?? 50),
        backgroundColor: btnBackgroundColor ?? Colors.cyan,
        shape: shape ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRaduis ?? 4),
            ),
      ),
      child: Text(
        btnText,
        style: btnTextStyle ??
            const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w900,
              color: Colors.black,
            ),
      ),
    );
  }
}
