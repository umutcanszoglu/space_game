import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:lit_starfield/view/lit_starfield_container.dart';
import 'package:lottie/lottie.dart';
import 'package:cosmic_clicker/const/const.dart';
import 'package:cosmic_clicker/controllers/auth_controller.dart';
import 'package:cosmic_clicker/controllers/home_controller.dart';
import 'package:cosmic_clicker/controllers/tutorial_controller.dart';
import 'package:cosmic_clicker/utils/custom_linear_progress_painter.dart';
import 'package:cosmic_clicker/utils/extensions.dart';
import 'package:cosmic_clicker/widgets/boost_card.dart';
import 'package:cosmic_clicker/widgets/dialog_button.dart';
import 'package:cosmic_clicker/widgets/item_card.dart';
import 'package:cosmic_clicker/widgets/money_card.dart';

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
      final box = Hive.box("config");
      final status = box.get("tutorial");
      if (status == null) {
        Get.find<TutorialController>().showTutorial(context);
        box.put("tutorial", true);
      }

      tabController.addListener(listener);
      return () => tabController.removeListener(listener);
    }, const []);

    return Scaffold(
      backgroundColor: niceBlackColor,
      body: Stack(
        children: [
          Obx(
            () => AnimatedCrossFade(
                firstChild: const LitStarfieldContainer(
                  animated: true,
                  velocity: 0.9,
                  backgroundDecoration: BoxDecoration(
                    gradient: RadialGradient(
                      radius: 1,
                      colors: [
                        cardTitleColor,
                        niceBlackColor,
                      ],
                    ),
                  ),
                ),
                secondChild: const LitStarfieldContainer(
                  animated: true,
                  velocity: 0.9,
                  backgroundDecoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        niceBlackColor,
                        niceBlackColor,
                      ],
                    ),
                  ),
                ),
                crossFadeState: controller.isBoosted.value
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 900)),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: () {
                  HapticFeedback.vibrate();
                  controller.increaseMoney();
                  controller.resizeRocket();
                  final money = (controller.passiveMoney.value) * 0.0004;
                  controller.passiveMoney.value += money;
                  final showMoney = ShowMoney(
                    key: DateTime.now().millisecondsSinceEpoch,
                    txt: "${controller.passiveMoney.value.doubleFormatter} 💰",
                  );
                  controller.moneyShower.add(showMoney);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Log Out
                        GestureDetector(
                          onTap: () {
                            Get.dialog(
                              AlertDialog(
                                shape:
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                                actionsPadding: const EdgeInsets.only(bottom: 16),
                                actionsAlignment: MainAxisAlignment.center,
                                backgroundColor: moneyCircleColor,
                                title: const Text(
                                  "Sign Out",
                                  textAlign: TextAlign.center,
                                ),
                                content: const Text(
                                  "Are you sure?",
                                  textAlign: TextAlign.center,
                                ),
                                actions: [
                                  DialogButton(
                                    color: red,
                                    buttonText: "Yes",
                                    onTap: () {
                                      Get.find<AuthController>().logOut();
                                      Get.back();
                                    },
                                  ),
                                  DialogButton(
                                    color: cardTitleColor,
                                    buttonText: "Back",
                                    onTap: Get.back,
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            padding: const EdgeInsets.symmetric(horizontal: 11),
                            decoration: BoxDecoration(
                              border: Border.all(color: moneyCircleColor, width: 2),
                              color: cardTitleColor,
                              shape: BoxShape.circle,
                            ),
                            child: const RotatedBox(
                              quarterTurns: 2,
                              child: logOutIcon,
                            ),
                          ),
                        ),
                        //MONEY CARD
                        Expanded(
                          child: Obx(
                            () => MoneyCard(
                              money: controller.money.value,
                              onGamePage: true,
                              onTap: () {
                                Get.bottomSheet(
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(32),
                                          topRight: Radius.circular(32)),
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
                                            "Feed Your Crew",
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
                                            child: Obx(
                                              () => ListView(
                                                physics: const BouncingScrollPhysics(
                                                  parent: AlwaysScrollableScrollPhysics(),
                                                ),
                                                children: [
                                                  const SizedBox(height: 20),
                                                  ...controller.upgrades
                                                      .asMap()
                                                      .entries
                                                      .where((e) => e.value.isActive == true)
                                                      .map(
                                                        (i) => Padding(
                                                          padding:
                                                              const EdgeInsets.only(bottom: 8.0),
                                                          child: ItemCard(
                                                            onTap: () {
                                                              controller.buyUpgrade(i.key);
                                                            },
                                                            item: i.value,
                                                            isAvailable: i.value.isAvailable,
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
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.only(left: 220.0),
                        child: Text(
                          "mps: ${controller.totalProfit.value.doubleFormatter}",
                          style: const TextStyle(
                              color: moneyCircleColor, fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                    ),
                    //MAIN ROCKET
                    Obx(
                      () => Expanded(
                        child: AnimatedContainer(
                          width: 80.0 + controller.rocketSize.value.toDouble(),
                          duration: const Duration(milliseconds: 300),
                          child: Lottie.asset("assets/lotties/rocket.json"),
                        ),
                      ),
                    ),
                    //PLANET CHANGE
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Animated(
                            duration: const Duration(seconds: 1),
                            value: 100 - (controller.progress.value * 100),
                            builder: (context, child, animation) => SizedBox(
                              width: animation.value,
                              child: Image.asset(Planets.planets[controller.planetChanger.value]),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Animated(
                              duration: const Duration(milliseconds: 600),
                              value: controller.progress.value,
                              builder: (context, child, animation) {
                                return SizedBox(
                                  width: double.infinity,
                                  height: 48,
                                  child: LayoutBuilder(builder: (context, constraints) {
                                    return Stack(
                                      children: [
                                        Positioned.fill(
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: CustomPaint(
                                              size: Size(constraints.maxWidth, 8),
                                              painter: CustomLinearProgressPainter(
                                                backgroundColor: Colors.transparent,
                                                valueColor: controller.isBoosted.value
                                                    ? Colors.orange
                                                    : cardTitleColor,
                                                value: animation.value,
                                                blurRadius: 8,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: constraints.maxWidth * animation.value - 6,
                                          top: 8,
                                          child: AnimatedContainer(
                                            duration: const Duration(milliseconds: 400),
                                            width: 32,
                                            height: 32,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: (controller.progress.value - animation.value <
                                                      0.001)
                                                  ? Colors.transparent
                                                  : Colors.transparent,
                                              borderRadius: BorderRadius.circular(32),
                                            ),
                                            child: const RotatedBox(
                                              quarterTurns: 1,
                                              child: Icon(
                                                Icons.rocket_rounded,
                                                color: moneyCircleColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Animated(
                            duration: const Duration(milliseconds: 600),
                            value: (controller.progress.value * 100),
                            builder: (context, child, animation) => SizedBox(
                              width: animation.value,
                              child:
                                  Image.asset(Planets.planets[controller.planetChanger.value + 1]),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
          Obx(
            () => Stack(
              children: [
                ...controller.moneyShower.map(
                  (e) => Positioned(
                    key: ValueKey(e.key),
                    left: Get.width / 2 - 20 - e.x,
                    top: Get.height / 2 - 180 - e.y,
                    child: Opacity(
                      opacity: e.opacity <= 0.0 ? 0 : e.opacity,
                      child: Text(
                        e.txt,
                        style: const TextStyle(
                            fontSize: 22, color: moneyCircleColor, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(seconds: 1),
                  right: controller.progress.value >= 0.5 ? 20 : -100,
                  top: Get.height * 0.20,
                  child: BoostCard(
                    isUsed: controller.isUsed.value,
                    onTap: () {
                      controller.ftlMode();
                      controller.isUsed.value = true;
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
