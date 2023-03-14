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
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    width: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: subCardColor,
                    ),
                    child: IconButton(onPressed: () => Get.back(), icon: goBackIcon),
                  ),
                  const SizedBox(width: 30),
                  const Text(
                    "Upgrades",
                    style: TextStyle(
                      color: moneyCircleColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(child: MoneyCard(money: controller.money.value)),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  children: [
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
            ],
          ),
        ),
      ),
    );
  }
}
