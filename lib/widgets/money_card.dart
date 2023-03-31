import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cosmic_clicker/controllers/tutorial_controller.dart';
import 'package:cosmic_clicker/utils/animated.dart';
import 'package:cosmic_clicker/utils/extensions.dart';

import '../const/const.dart';

class MoneyCard extends GetView<TutorialController> {
  const MoneyCard({super.key, required this.money, required this.onTap, this.onGamePage = false});
  final double money;
  final bool onGamePage;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
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
                decoration: BoxDecoration(
                  border: Border.all(color: moneyCircleColor, width: 2),
                  color: cardTitleColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    bottomLeft: Radius.circular(24),
                  ),
                ),
                child: Animated(
                  value: money,
                  duration: const Duration(milliseconds: 500),
                  builder: (context, child, animation) => Text(
                    animation.value.doubleFormatter,
                    style: const TextStyle(
                      color: moneyCircleColor,
                      fontSize: 20,
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
              width: 50,
              height: 50,
              key: onGamePage ? controller.key : null,
              decoration: BoxDecoration(
                border: Border.all(color: moneyCircleColor, width: 2),
                boxShadow: const [
                  BoxShadow(offset: Offset(0, 0), blurRadius: 1, spreadRadius: 1),
                ],
                color: cardTitleColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.attach_money,
                color: moneyCircleColor,
                size: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
