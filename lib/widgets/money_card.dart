import 'package:flutter/material.dart';
import 'package:space_game/utils/animated.dart';
import 'package:space_game/utils/extensions.dart';

import '../const/const.dart';

class MoneyCard extends StatelessWidget {
  const MoneyCard({super.key, required this.money});
  final double money;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 40,
          top: 10,
          child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              alignment: Alignment.center,
              height: 30,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                  color: moneyCircleColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    bottomLeft: Radius.circular(24),
                  )),
              child: Animated(
                value: money,
                duration: const Duration(milliseconds: 500),
                builder: (context, child, animation) => Text(
                  animation.value.doubleFormatter,
                  style: const TextStyle(
                    color: niceBlackColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: const EdgeInsets.only(left: 1),
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(offset: Offset(0, 0), blurRadius: 1, spreadRadius: 1),
              ],
              color: moneyCircleColor,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.attach_money,
              color: cardTitleColor,
              size: 40,
            ),
          ),
        ),
      ],
    );
  }
}
