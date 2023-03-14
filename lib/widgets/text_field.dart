import 'package:flutter/material.dart';

import '../const/const.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {super.key, required this.icon, required this.hintText, required this.isObscure});
  final Icon icon;
  final String hintText;
  final bool isObscure;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isObscure,
      decoration: InputDecoration(
        iconColor: moneyCircleColor,
        prefixIcon: icon,
        prefixIconColor: backgroundColor,
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: backgroundColor, width: 1),
          borderRadius: BorderRadius.circular(32),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: backgroundColor, width: 1),
          borderRadius: BorderRadius.circular(32),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: backgroundColor, width: 1),
          borderRadius: BorderRadius.circular(32),
        ),
      ),
    );
  }
}
