// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../models/planet_upgrade.dart';
import '../models/upgrade.dart';

const backgroundColor = Color(0xff1E1E1E);
const niceBlackColor = Color(0xff0b0c0b);
const cardColor = Color(0xff787878);
const subCardColor = Color.fromARGB(255, 131, 164, 134);
const cardTitleColor = Color(0xff628c36);
const cardButtonColor = Color.fromARGB(255, 163, 150, 15);
const moneyCircleColor = Color.fromARGB(255, 214, 214, 214);
const upgradeIcon = Icon(Icons.settings, size: 50, color: moneyCircleColor);
const rocketIcon = Icon(Icons.rocket_launch_outlined, size: 50, color: moneyCircleColor);
const boostIcon = Icon(Icons.double_arrow, size: 50, color: moneyCircleColor);
const emailIcon = Icon(Icons.mail_outlined);
const passwordIcon = Icon(Icons.lock_outline_rounded);
const passwordConfirmIcon = Icon(Icons.lock_open_outlined);
const nameIcon = Icon(Icons.person_outline_rounded);
const avatarIcon = Icon(Icons.account_circle_rounded, size: 200, color: cardColor);
const coal = "assets/coal.png";
const iron = "assets/iron.png";
const gold = "assets/gold.png";
const diamond = "assets/diamond.png";
const emerald = "assets/emerald.png";
const red = "assets/red.png";
const lapis = "assets/lapis.png";
const uranium = "assets/uranium.png";
const jesus = "assets/jesus.png";
const supra = "assets/supra.png";
const pala = "assets/pala.png";

class Planets {
  static final planets = <String>[
    "assets/earth.json",
    "assets/moon.json",
    "assets/mars.json",
    "assets/saturn.json",
    "assets/planet.json",
  ];
}

class PlanetUpgrades {
  static final planetUpgrades = <PlanetUpgrade>[
    PlanetUpgrade(
      image: "assets/upCoal.png",
      name: "Coal - Level Up!",
      detail: "this item gets twice coal.",
      price: 1000.0,
    ),
  ];
}

class Upgrades {
  static final upgrades = <Upgrade>[
    Upgrade(
      image: coal,
      itemName: "Coal",
      itemEffect: "Each coal earns you",
      itemEffects: "Coal earns you",
      price: 100,
      itemProfit: 1,
      itemCount: 0,
      isAvailable: false,
    ),
    Upgrade(
      image: iron,
      itemName: "Iron",
      itemEffect: "Each iron earns you",
      itemEffects: "Iron earns you",
      price: 400,
      itemProfit: 2,
      itemCount: 0,
      isAvailable: false,
    ),
    Upgrade(
      image: gold,
      itemName: "Gold",
      itemEffect: "Each gold earns you",
      itemEffects: "Gold earns you",
      price: 800,
      itemProfit: 4,
      itemCount: 0,
      isAvailable: false,
    ),
    Upgrade(
      image: diamond,
      itemName: "Diamond",
      itemEffect: "Each diamond earns you",
      itemEffects: "Diamond earns you",
      price: 1600,
      itemProfit: 8,
      itemCount: 0,
      isAvailable: false,
    ),
    Upgrade(
      image: emerald,
      itemName: "Emerald",
      itemEffect: "Each emerald earns you",
      itemEffects: "Emerald earns you",
      price: 3200,
      itemProfit: 16,
      itemCount: 0,
      isAvailable: false,
    ),
    Upgrade(
      image: lapis,
      itemName: "Lapis Lazuli",
      itemEffect: "Each lapis earns you",
      itemEffects: "Lapis earns you",
      price: 6400,
      itemProfit: 32,
      itemCount: 0,
      isAvailable: false,
    ),
    Upgrade(
      image: uranium,
      itemName: "Uranium",
      itemEffect: "Each uranium earns you",
      itemEffects: "Uranium earns you",
      price: 12800,
      itemProfit: 64,
      itemCount: 0,
      isAvailable: false,
    ),
    Upgrade(
      image: jesus,
      itemName: "Jesus Christ",
      itemEffect: "Each jesus earns you",
      itemEffects: "Jesus earns you",
      price: 25600,
      itemProfit: 128,
      itemCount: 0,
      isAvailable: false,
    ),
    Upgrade(
      image: supra,
      itemName: "Supra MK4",
      itemEffect: "Each supra earns you",
      itemEffects: "Supra earns you",
      price: 51200,
      itemProfit: 256,
      itemCount: 0,
      isAvailable: false,
    ),
    Upgrade(
      image: pala,
      itemName: "Pala Baba",
      itemEffect: "Each pala earns you",
      itemEffects: "Pala earns you",
      price: 102400,
      itemProfit: 512,
      itemCount: 0,
      isAvailable: false,
    ),
  ];
}
