import 'package:flutter/material.dart';

import '../const/const.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {super.key,
      required this.icon,
      required this.hintText,
      required this.isObscure,
      this.controller});
  final Icon icon;
  final String hintText;
  final bool isObscure;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isObscure,
      style: const TextStyle(color: moneyCircleColor),
      decoration: InputDecoration(
        iconColor: moneyCircleColor,
        prefixIcon: icon,
        prefixIconColor: moneyCircleColor,
        hintText: hintText,
        hintStyle: const TextStyle(color: moneyCircleColor),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: moneyCircleColor, width: 1),
          borderRadius: BorderRadius.circular(32),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: moneyCircleColor, width: 1),
          borderRadius: BorderRadius.circular(32),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: moneyCircleColor, width: 1),
          borderRadius: BorderRadius.circular(32),
        ),
      ),
    );
  }
}
