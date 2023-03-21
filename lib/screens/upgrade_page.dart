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
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    width: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: moneyCircleColor, width: 2),
                      shape: BoxShape.circle,
                      color: cardTitleColor,
                    ),
                    child: IconButton(onPressed: () => Get.back(), icon: goBackIcon),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                      child: Obx(() => MoneyCard(
                            money: controller.money.value,
                            onTap: () {},
                          ))),
                ],
              ),
              const SizedBox(height: 32),
              Expanded(
                child: Obx(
                  () => ListView(
                    physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                    children: [
                      ...controller.planetUpgrades
                          .asMap()
                          .entries
                          .where((element) => element.value.isActive == true)
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: PlanetUpgradeWidget(
                                onTap: () {
                                  controller.buyPlanetUpgrade(e.key);
                                  if (e.value.rank < 5) {
                                    e.value.rank += 1;
                                  } else {
                                    e.value.rank = 0;
                                  }
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
            ],
          ),
        ),
      ),
    );
  }
}
