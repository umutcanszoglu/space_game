import 'package:flutter/material.dart';
import 'package:space_game/utils/extensions.dart';

import '../const/const.dart';
import '../models/planet_upgrade.dart';

class PlanetUpgradeWidget extends StatelessWidget {
  const PlanetUpgradeWidget(
      {super.key, required this.onTap, required this.isAvailable, required this.item});
  final PlanetUpgrade item;
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    item.image,
                    width: 50,
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
                  Text(
                    item.price.doubleFormatter,
                    style: const TextStyle(
                        color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
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