import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  const DialogButton(
      {super.key, required this.buttonText, required this.onTap, required this.color});
  final String buttonText;
  final Function() onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 40,
      child: ClipRRect(
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(26),
            ),
            backgroundColor: color,
          ),
          child: Text(
            buttonText,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
