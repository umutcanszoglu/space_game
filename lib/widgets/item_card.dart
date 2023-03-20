import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:space_game/controllers/home_controller.dart';
import 'package:space_game/models/upgrade.dart';
import 'package:space_game/utils/animated.dart';
import 'package:space_game/utils/extensions.dart';

import '../const/const.dart';

class ItemCard extends GetView<HomeController> {
  const ItemCard({super.key, required this.onTap, required this.item, required this.isAvailable});
  final Upgrade item;
  final bool isAvailable;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
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
                    niceBlackColor,
                    cardTitleColor,
                    niceBlackColor,
                  ]
                : [
                    niceBlackColor,
                    Colors.grey,
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
                color: isAvailable ? subCardColor : niceBlackColor,
                borderRadius: BorderRadius.circular(32),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  isAvailable
                      ? Image.asset(
                          item.image,
                          width: 50,
                        )
                      : ColorFiltered(
                          colorFilter:
                              ColorFilter.mode(niceBlackColor.withOpacity(0.8), BlendMode.srcATop),
                          child: Image.asset(
                            item.image,
                            width: 50,
                          ),
                        ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(6),
                    width: double.infinity,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(32),
                        bottomRight: Radius.circular(32),
                      ),
                      color: isAvailable ? cardTitleColor : niceBlackColor,
                    ),
                    child: Text(
                      item.itemCount.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
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
                    item.itemName,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "${item.itemEffect} ${item.itemProfit.doubleFormatter} coins per second",
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "${item.itemCount} ${item.itemEffects} ${(item.itemCount * item.itemProfit).doubleFormatter} coins per second",
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
