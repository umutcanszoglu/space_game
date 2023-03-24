import 'package:flutter/material.dart';
import 'package:space_game/const/const.dart';

class DialogButton extends StatelessWidget {
  const DialogButton({super.key, required this.buttonText, required this.onTap});
  final String buttonText;
  final Function() onTap;

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
            backgroundColor: cardTitleColor,
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
