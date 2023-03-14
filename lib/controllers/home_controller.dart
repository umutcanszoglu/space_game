import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:space_game/const/const.dart';

import '../screens/upgrade_page.dart';

class HomeController extends GetxController {
  final globalKey = GlobalKey<ScaffoldState>();

  final money = 0.0.obs;
  final rocketSize = 200.obs;
  final progress = 0.0.obs;
  final planetSize = 50.obs;
  final upgrades = Upgrades.upgrades.obs;
  final planets = Planets.planets.obs;
  final planetUpgrades = PlanetUpgrades.planetUpgrades.obs;
  final passive = 0.10.obs;
  final planetChanger = 0.obs;
  final currentTabIndex = 0.obs;
  final buyCount = 1.obs;

  void increaseMoney() {
    money.value += 5;
  }

  void passiveIncreaseMoney() {
    money.value += passive.value;
  }

  // void addUpgrade() {
  //   upgrades.insert(0, Upgrades.upgrades.first);
  // }

  void buyUpgrade(int key) {
    if (money.value >= upgrades[key].price) {
      upgrades[key].itemCount += buyCount.value;
      money.value -= upgrades[key].price;
      passive.value += upgrades[key].itemProfit * buyCount.value;
      syncPrices();
      refreshUpgrades();
    }
  }

  void buyPlanetUpgrade(int key) {
    if (money.value >= upgrades[key].price) {
      money.value -= planetUpgrades[key].price;
      upgrades[key].itemProfit *= 2;
      refreshPlanetUpgrades();
    }
  }

  void boost() {
    progress.value = min(1, progress.value + 0.01);
    money.value += 250;
  }

  void resizeRocket() async {
    rocketSize.value += 100;
    await Future.delayed(const Duration(milliseconds: 100));
    rocketSize.value = 200;
    changeProgress();
  }

  Timer? timer;

  void startTimer() {
    timer?.cancel();
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (progress.value < 1.0) {
          passiveProgress();
          passiveIncreaseMoney();
        } else if (progress.value >= 0.93) {
          if (planetChanger.value > 2) {
            planetChanger.value = 0;
          }
          planetChanger.value += 1;
          progress.value = 0;
          Get.to(const UpgradePage());
        } else {
          timer.cancel();
        }
      },
    );
  }

  void stopTimer() {
    timer?.cancel();
  }

  @override
  void onInit() {
    startTimer();

    ever(money, (_) {
      refreshUpgrades();
      refreshPlanetUpgrades();
    });

    ever(buyCount, (_) {
      syncPrices();
      refreshUpgrades();
    });
    super.onInit();
  }

  void syncPrices() {
    for (final upgrade in upgrades) {
      upgrade.price = 0;
      for (int i = 0; i < buyCount.value + upgrade.itemCount; i++) {
        upgrade.price += upgrade.initialPrice * pow(1.1, i);
      }
    }
  }

  void refreshUpgrades() {
    for (final upgrade in upgrades) {
      if (money.value >= upgrade.price) {
        upgrade.isAvailable = true;
      } else {
        upgrade.isAvailable = false;
      }
    }
    upgrades.refresh();
  }

  void refreshPlanetUpgrades() {
    for (final upgrade in planetUpgrades) {
      if (money.value >= upgrade.price) {
        upgrade.isAvailable = true;
      } else {
        upgrade.isAvailable = false;
      }
    }
    planetUpgrades.refresh();
  }

  void changeProgress() {
    progress.value = min(1, progress.value + 0.0001);
  }

  void passiveProgress() {
    progress.value = min(1, progress.value + 0.00001);
  }
}
