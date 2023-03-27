import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:space_game/controllers/home_controller.dart';
import 'package:space_game/models/ship_upgrade.dart';
import 'package:space_game/utils/animated.dart';
import 'package:space_game/utils/extensions.dart';

import '../const/const.dart';

class ShipUpgradeWidget extends StatelessWidget {
  const ShipUpgradeWidget(
      {super.key, required this.onTap, required this.isAvailable, required this.item});
  final ShipUpgrade item;
  final bool isAvailable;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return GestureDetector(
      onTap: isAvailable ? onTap : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        height: 165,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: isAvailable
                ? [
                    const Color(0xff40394A),
                    const Color(0xff7ECA9C),
                    const Color(0xff40394A),
                  ]
                : [
                    niceBlackColor,
                    cardColor,
                    niceBlackColor,
                  ],
          ),
          color: cardColor,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1),
                color: isAvailable ? moneyCircleColor : niceBlackColor,
                borderRadius: BorderRadius.circular(32),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      controller.upgradeColorss[item.rank].withOpacity(0.7),
                      BlendMode.srcATop,
                    ),
                    child: Image.asset(
                      item.image,
                      width: 60,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.detail,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  const SizedBox(height: 8),
                  Animated(
                    value: item.price,
                    duration: const Duration(milliseconds: 500),
                    builder: (context, child, animation) => Text(
                      "${animation.value.doubleFormatter} \$",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
