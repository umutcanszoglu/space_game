import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:space_game/const/const.dart';
import 'package:space_game/controllers/home_controller.dart';
import 'package:space_game/widgets/money_card.dart';
import 'package:space_game/widgets/planet_upgrade.dart';

class UpgradePage extends StatelessWidget {
  const UpgradePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                MoneyCard(money: controller.money.value),
                const SizedBox(height: 16),
                ...PlanetUpgrades.planetUpgrades.asMap().entries.map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: PlanetUpgradeWidget(
                          onTap: () {
                            controller.buyPlanetUpgrade(e.key);
                            Get.back();
                          },
                          isAvailable: e.value.isAvailable,
                          item: e.value,
                        ),
                      ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
