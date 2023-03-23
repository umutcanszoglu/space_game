// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:space_game/const/const.dart';
import 'package:space_game/controllers/auth_controller.dart';
import 'package:space_game/models/game_save.dart';
import 'package:space_game/services/game_save_api.dart';

import '../screens/upgrade_page.dart';

class ShowMoney {
  final int key;
  final String txt;
  double opacity;
  double x;
  double y;
  double vx;
  double vy;

  ShowMoney({
    required this.key,
    required this.txt,
    this.opacity = 1.0,
    this.x = 0,
    this.y = 0,
    this.vy = 10,
  }) : vx = Random().nextDouble() * 10 - 5.0;
}

class HomeController extends GetxController {
  final globalKey = GlobalKey<ScaffoldState>();

  final money = 0.0.obs;
  final rocketSize = 200.obs;
  final progress = 0.0.obs;
  final planetSize = 50.obs;
  final upgrades = Upgrades.upgrades.obs;
  final upgradeColorss = upgradeColors;
  final planetUpgrades = PlanetUpgrades.planetUpgrades.obs;
  final planetChanger = 0.obs;
  final currentTabIndex = 0.obs;
  final buyCount = 1.obs;
  final random1 = 0.obs;
  final random2 = 0.obs;
  final passiveMoney = 1.0.obs;
  final totalProfit = 0.0.obs;
  Duration? duration;

  final moneyShower = <ShowMoney>[].obs;
  Timer? moneyTimer;

  void increaseMoney() {
    money.value += passiveMoney.value;
  }

  void getAllProfit() {
    totalProfit.value = upgrades.fold<double>(0, (a, b) => b.itemProfit * b.itemCount + a);
  }

  void passiveIncreaseMoney() {
    //money.value += passive.value;
    double increase = 0;
    for (final upgrade in upgrades) {
      increase += upgrade.itemProfit * upgrade.itemCount;
    }
    money.value += increase;
  }

  void buyUpgrade(int key) {
    if (money.value >= upgrades[key].price) {
      upgrades[key].itemCount += buyCount.value;
      money.value -= upgrades[key].price;
      syncPrices();
      refreshUpgrades();
    }
  }

  void buyPlanetUpgrade(int key) {
    if (money.value >= planetUpgrades[key].price) {
      money.value -= planetUpgrades[key].price;
      planetUpgrades[key].price *= 10;
      upgrades[key].itemProfit *= 2;
      refreshPlanetUpgrades();
      refreshUpgrades();
    }
  }

  void boost() {
    progress.value = min(1, progress.value + 0.1);
    money.value += 100;
  }

  void playCoinSound() async {
    final player = AudioPlayer();
    await player.setAsset("assets/audios/laser.wav");
    await player.play();
    await player.dispose();
  }

  void resizeRocket() async {
    playCoinSound();
    rocketSize.value += 100;
    await Future.delayed(const Duration(milliseconds: 100));
    rocketSize.value = 200;
    changeProgress();
  }

  Timer? timer;

  void startTimer() {
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (progress.value < 1.0) {
        passiveProgress();
        passiveIncreaseMoney();
      } else if (progress.value >= 0.93) {
        if (planetChanger.value > 22) {
          planetChanger.value = 0;
        }
        planetChanger.value += 1;
        progress.value = 0;
        Get.to(const UpgradePage());
      }
    });
  }

  void stopTimer() {
    timer?.cancel();
  }

  @override
  @override
  void onInit() async {
    startTimer();
    getAllProfit();
    ever(upgrades, (_) => getAllProfit());

    ever(money, (_) {
      refreshUpgrades();
      refreshPlanetUpgrades();
      getPurchasable();
      getPurchasableUpgrade();
    });

    final res = await getSave();

    if (res != null) {
      money.value = res.money;
    }

    ever(buyCount, (_) {
      syncPrices();
      refreshUpgrades();
    });

    moneyTimer?.cancel();
    moneyTimer = Timer.periodic(const Duration(milliseconds: 16), (_) {
      for (final showMoney in moneyShower) {
        showMoney.opacity -= 0.01;
        showMoney.x += showMoney.vx;
        showMoney.y += showMoney.vy;
        showMoney.vy -= 0.7;
      }
      for (int i = 0; i < moneyShower.length; i++) {
        if (moneyShower[i].opacity < 0) moneyShower.removeAt(i);
      }
      moneyShower.refresh();
    });

    super.onInit();
  }

  Future<GameSave?> getSave() async {
    final uid = Get.find<AuthController>().profile.value!.uid;

    EasyLoading.show(maskType: EasyLoadingMaskType.clear);
    final result = await GameSaveApi.getSave(uid);
    EasyLoading.dismiss();

    return result;
  }

  void getPurchasable() {
    for (var upgrade in upgrades) {
      if (money.value > upgrade.price - 50) {
        upgrade.isActive = true;
      }
    }
  }

  void getPurchasableUpgrade() {
    for (var upgrade in planetUpgrades) {
      if (money.value > upgrade.price) {
        upgrade.isActive = true;
      }
    }
  }

  void syncPrices() {
    for (final upgrade in upgrades) {
      upgrade.price = upgrade.initialPrice * pow(1.15, upgrade.itemCount);
      if (buyCount.value == 10) upgrade.price *= 20.303718238;
      if (buyCount.value == 100) upgrade.price *= 7828749.671335256;
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
    upgrades.refresh();
  }

  void changeProgress() {
    progress.value = min(1, progress.value + 0.00075);
  }

  void passiveProgress() {
    progress.value = min(1, progress.value + 0.00001);
  }

  void saveGame() async {
    final save = GameSave(
      money: money.value,
      planetChanger: planetChanger.value,
      upgrades: upgrades,
      planetUpgrades: planetUpgrades,
    );

    final uid = Get.find<AuthController>().profile.value!.uid;
    EasyLoading.show(maskType: EasyLoadingMaskType.clear);

    final result = await GameSaveApi.saveGame(uid, save);

    if (result) {
      snackbar("Game Save", "Success", Colors.green);
    } else {
      snackbar("Game Save", "Failed", red);
    }

    EasyLoading.dismiss();
  }

  void snackbar(String title, String msg, Color color) {
    Get.snackbar(
      title,
      msg,
      snackPosition: SnackPosition.BOTTOM,
      colorText: moneyCircleColor,
      margin: const EdgeInsets.all(20),
      backgroundColor: color,
      duration: const Duration(seconds: 2),
    );
  }
}
