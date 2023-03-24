import 'package:flutter/material.dart';
import 'package:space_game/const/const.dart';

class SignButtons extends StatelessWidget {
  const SignButtons({super.key, required this.logo, required this.onTap});
  final String logo;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ClipRRect(
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(26),
            ),
            backgroundColor: moneyCircleColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                logo,
                width: 50,
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
