import 'package:flutter/material.dart';
import 'package:space_game/const/const.dart';

class BoostCard extends StatelessWidget {
  const BoostCard({super.key, required this.onTap, required this.isUsed});
  final Function() onTap;
  final bool isUsed;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: isUsed ? 0 : 1,
      child: IgnorePointer(
        ignoring: isUsed,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: moneyCircleColor,
                border: Border.all(color: cardTitleColor, width: 3)),
            child: rocketIcon,
          ),
        ),
      ),
    );
  }
}
