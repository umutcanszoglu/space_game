import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:lit_starfield/view/lit_starfield_container.dart';
import 'package:lottie/lottie.dart';
import 'package:space_game/const/const.dart';
import 'package:space_game/controllers/home_controller.dart';
import 'package:space_game/widgets/game_drawer.dart';
import 'package:space_game/widgets/item_card.dart';
import 'package:space_game/widgets/main_buttons.dart';
import 'package:space_game/widgets/money_card.dart';

import '../utils/animated.dart';

class GamePage extends HookWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    final tabController = useTabController(initialLength: 3);

    void listener() {
      controller.currentTabIndex.value = tabController.index;
      if (controller.currentTabIndex.value == 0) {
        controller.buyCount.value = 1;
      }
      if (controller.currentTabIndex.value == 1) {
        controller.buyCount.value = 10;
      }
      if (controller.currentTabIndex.value == 2) {
        controller.buyCount.value = 100;
      }
    }

    useEffect(() {
      tabController.addListener(listener);
      return () => tabController.removeListener(listener);
    }, const []);

    return Scaffold(
      key: controller.globalKey,
      drawer: SafeArea(
        child: Drawer(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          backgroundColor: backgroundColor,
          child: const GameDrawer(),
        ),
      ),
      backgroundColor: niceBlackColor,
      body: Stack(
        children: [
          const LitStarfieldContainer(
            animated: true,
            velocity: 0.9,
            backgroundDecoration: BoxDecoration(
              color: niceBlackColor,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => controller.globalKey.currentState?.openDrawer(),
                        child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: moneyCircleColor, width: 2),
                              color: cardTitleColor,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.rocket_rounded,
                              size: 35,
                              color: moneyCircleColor,
                            )),
                      ),
                      Expanded(child: Obx(() => MoneyCard(money: controller.money.value))),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Obx(() => Expanded(
                        child: AnimatedContainer(
                          width: controller.rocketSize.value.toDouble(),
                          duration: const Duration(milliseconds: 300),
                          child: Lottie.asset(
                            "assets/rocket.json",
                          ),
                        ),
                      )),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Animated(
                            duration: const Duration(seconds: 1),
                            value: 100 - (controller.progress.value * 100),
                            builder: (context, child, animation) => SizedBox(
                                  width: animation.value,
                                  child: Lottie.asset(
                                    controller.planets[controller.planetChanger.value],
                                  ),
                                )),
                        Expanded(
                          child: Animated(
                            duration: const Duration(milliseconds: 600),
                            value: controller.progress.value,
                            builder: (context, child, animation) {
                              return SliderTheme(
                                data: const SliderThemeData(
                                    thumbColor: Colors.green,
                                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0)),
                                child: Slider(
                                  onChanged: (_) {},
                                  value: animation.value,
                                  activeColor: moneyCircleColor,
                                ),
                              );
                            },
                          ),
                        ),
                        Animated(
                          duration: const Duration(milliseconds: 600),
                          value: (controller.progress.value * 100),
                          builder: (context, child, animation) => SizedBox(
                            width: animation.value,
                            child: Lottie.asset(
                              controller.planets[controller.planetChanger.value + 1],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MainButtons(
                          onTap: () {
                            controller.boost();
                            controller.resizeRocket();
                          },
                          icon: boostIcon),
                      MainButtons(
                        onTap: () {
                          controller.increaseMoney();
                          controller.resizeRocket();
                        },
                        icon: rocketIcon,
                      ),
                      MainButtons(
                        icon: upgradeIcon,
                        onTap: () {
                          Get.bottomSheet(
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(32), topRight: Radius.circular(32)),
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    subCardColor,
                                    cardColor,
                                    subCardColor,
                                  ],
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24),
                                child: Column(
                                  children: [
                                    const Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 16),
                                        child: Icon(
                                          Icons.horizontal_rule_rounded,
                                          color: Colors.white,
                                          size: 50,
                                        )),
                                    const Text(
                                      "Upgrade Your Fuel",
                                      style: TextStyle(
                                        color: moneyCircleColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    TabBar(
                                      controller: tabController,
                                      indicatorColor: moneyCircleColor,
                                      tabs: const [
                                        Text(
                                          "x1",
                                          style: TextStyle(fontSize: 25),
                                        ),
                                        Text(
                                          "x10",
                                          style: TextStyle(fontSize: 25),
                                        ),
                                        Text(
                                          "x100",
                                          style: TextStyle(fontSize: 25),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Obx(() => ListView(
                                            physics: const BouncingScrollPhysics(
                                              parent: AlwaysScrollableScrollPhysics(),
                                            ),
                                            children: [
                                              const SizedBox(height: 20),
                                              ...controller.upgrades.asMap().entries.map(
                                                    (e) => Padding(
                                                      padding: const EdgeInsets.only(bottom: 16.0),
                                                      child: ItemCard(
                                                        onTap: () {
                                                          controller.buyUpgrade(e.key);
                                                        },
                                                        item: e.value,
                                                        isAvailable: e.value.isAvailable,
                                                      ),
                                                    ),
                                                  ),
                                            ],
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
