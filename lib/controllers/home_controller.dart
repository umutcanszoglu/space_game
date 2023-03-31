// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:cosmic_clicker/const/const.dart';
import 'package:cosmic_clicker/controllers/auth_controller.dart';
import 'package:cosmic_clicker/models/game_save.dart';
import 'package:cosmic_clicker/services/game_save_api.dart';
import 'package:cosmic_clicker/utils/helpers.dart';
import 'package:cosmic_clicker/widgets/dialog_button.dart';

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
  final money = 0.0.obs;
  final planetChanger = 0.obs;
  final upgrades = Upgrades.upgrades.obs;
  final planetUpgrades = PlanetUpgrades.planetUpgrades.obs;
  final shipUpgrades = ShipUpgrades.shipUpgrades.obs;

  final rocketSize = 200.obs;
  final progress = 0.0.obs;
  final passiveValue = 0.001.obs;
  final planetSize = 50.obs;
  final upgradeColorss = upgradeColors;
  final currentTabIndex = 0.obs;
  final buyCount = 1.obs;
  final random1 = 0.obs;
  final random2 = 0.obs;
  final passiveMoney = 1.0.obs;
  final totalProfit = 0.0.obs;
  final isBoosted = false.obs;
  final isUsed = false.obs;

  Duration? duration;
  List<String> waws = [
    "assets/audios/shoot1.wav",
    "assets/audios/shoot2.wav",
    "assets/audios/shoot3.wav",
    "assets/audios/shoot4.wav",
    "assets/audios/shoot5.wav",
  ];

  final moneyShower = <ShowMoney>[].obs;
  Timer? moneyTimer;
  Timer? boostTimer;

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
      HapticFeedback.vibrate();
      upgrades[key].itemCount += buyCount.value;
      money.value -= upgrades[key].price;
      syncPrices();
      refreshUpgrades();
    }
  }

  void buyPlanetUpgrade(int key) {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        actionsPadding: const EdgeInsets.only(bottom: 16),
        actionsAlignment: MainAxisAlignment.center,
        backgroundColor: moneyCircleColor,
        title: const Text(
          "Buying this item",
          textAlign: TextAlign.center,
        ),
        content: const Text(
          "Are you sure?",
          textAlign: TextAlign.center,
        ),
        actions: [
          DialogButton(
            color: cardTitleColor,
            buttonText: "Yes",
            onTap: () {
              if (money.value >= planetUpgrades[key].price) {
                HapticFeedback.vibrate();
                money.value -= planetUpgrades[key].price;
                planetUpgrades[key].price *= 10;
                upgrades[key].itemProfit *= 2;

                refreshPlanetUpgrades();
                refreshUpgrades();
                Get.back();

                if (planetUpgrades[key].rank < 5) {
                  planetUpgrades[key].rank += 1;
                } else {
                  planetUpgrades[key].rank = 0;
                }
              } else {
                Get.back();
              }
            },
          ),
          DialogButton(
            color: red,
            buttonText: "Back",
            onTap: Get.back,
          ),
        ],
      ),
    );
  }

  void buyShipUpgrade(int key) {
    if (money.value >= shipUpgrades[key].price) {
      HapticFeedback.vibrate();
      money.value -= shipUpgrades[key].price;
      shipUpgrades[key].price *= 10;
      passiveValue.value *= 2.5;
      refreshShipUpgrades();
      Helpers.snackbar("Upgrade Buy", "Success", Colors.green);
    }
  }

  void boost() {
    progress.value = min(1, progress.value + 1);
    money.value += 100;
  }

  void playCoinSound() async {
    final random = Random().nextInt(5);
    final player = AudioPlayer();
    await player.setAsset(waws[random]);
    await player.play();
    await player.dispose();
  }

  void playBoostSound() async {
    final player = AudioPlayer();
    await player.setAsset("assets/audios/faster.wav");
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
      } else if (progress.value >= 0.85) {
        if (planetChanger.value > 21) {
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
  void onClose() {
    moneyTimer?.cancel();
    timer?.cancel();
    boostTimer?.cancel();

    super.onClose();
  }

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
      refreshShipUpgrades();
    });

    await fetchSave();

    ever(planetChanger, (_) {
      saveGame();
      isUsed.value = false;
    });
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

  Future<void> fetchSave() async {
    final res = await getSave();

    if (res != null) {
      money.value = res.money;
      planetChanger.value = res.planetChanger;
      upgrades.value = res.upgrades;
      planetUpgrades.value = res.planetUpgrades;
    } else {
      resetSave();
    }
  }

  void resetSave() {
    money.value = 0.0;
    planetChanger.value = 0;
    upgrades.value = Upgrades.upgrades;
    planetUpgrades.value = PlanetUpgrades.planetUpgrades;
    shipUpgrades.value = ShipUpgrades.shipUpgrades;
  }

  void ftlMode() async {
    playBoostSound();
    isBoosted.value = true;
    for (var e in upgrades) {
      e.itemProfit = (e.itemProfit * 5);
    }
    await Future.delayed(const Duration(seconds: 1));
    passiveValue.value = 0.05;
    boostTimer?.cancel();
    boostTimer = Timer(
      const Duration(seconds: 7),
      () async {
        isBoosted.value = false;
        passiveValue.value = 0.001;
        for (var e in upgrades) {
          e.itemProfit = (e.itemProfit / 5);
        }
        isUsed.value = true;
        boostTimer?.cancel();
      },
    );
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

  void refreshShipUpgrades() {
    for (final upgrade in shipUpgrades) {
      if (money.value >= upgrade.price) {
        upgrade.isAvailable = true;
      } else {
        upgrade.isAvailable = false;
      }
    }
    shipUpgrades.refresh();
  }

  void changeProgress() {
    progress.value = min(1, progress.value + 0.001);
  }

  void passiveProgress() {
    progress.value = min(1, progress.value + passiveValue.value);
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
      Helpers.snackbar("Game Save", "Success", Colors.green);
    } else {
      Helpers.snackbar("Game Save", "Failed", red);
    }

    EasyLoading.dismiss();
  }
}
