import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:cosmic_clicker/const/const.dart';
import 'package:cosmic_clicker/controllers/home_controller.dart';
import 'package:cosmic_clicker/widgets/money_card.dart';
import 'package:cosmic_clicker/widgets/planet_upgrade.dart';
import 'package:cosmic_clicker/widgets/ship_upgrade.dart';

class UpgradePage extends HookWidget {
  const UpgradePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    final tabController =
        useTabController(initialLength: 2, initialIndex: controller.currentTabIndex.value);

    void listener() {
      controller.currentTabIndex.value = tabController.index;
    }

    useEffect(() {
      tabController.addListener(listener);

      return () => tabController.removeListener(listener);
    }, const []);

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
                    child: IconButton(
                        onPressed: () => Get.back(closeOverlays: true), icon: goBackIcon),
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
              TabBar(
                controller: tabController,
                indicatorColor: moneyCircleColor,
                tabs: const [
                  Text(
                    "Meal",
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    "Ship",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Obx(
                () => controller.currentTabIndex.value == 0
                    ? Expanded(
                        child: Obx(
                          () => ListView(
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
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
                                        },
                                        isAvailable: e.value.isAvailable,
                                        item: e.value,
                                      ),
                                    ),
                                  ),
                            ],
                          ),
                        ),
                      )
                    : Expanded(
                        child: Obx(
                          () => ListView(
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            children: [
                              ...controller.shipUpgrades
                                  .asMap()
                                  .entries
                                  .where((element) => element.value.isActive == true)
                                  .map(
                                    (e) => Padding(
                                      padding: const EdgeInsets.only(bottom: 8.0),
                                      child: ShipUpgradeWidget(
                                        onTap: () {
                                          controller.buyShipUpgrade(e.key);
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
