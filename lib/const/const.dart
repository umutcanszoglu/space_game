// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../models/planet_upgrade.dart';
import '../models/upgrade.dart';

//Colors
const backgroundColor = Color(0xff1E1E1E);
const niceBlackColor = Color(0xff0b0c0b);
const cardColor = Color(0xff787878);
const subCardColor = Color.fromARGB(255, 131, 164, 134);
const cardTitleColor = Color(0xff628c36);
const cardButtonColor = Color.fromARGB(255, 163, 150, 15);
const moneyCircleColor = Color.fromARGB(255, 214, 214, 214);
//Icons
const goBackIcon = Icon(Icons.arrow_back_ios, size: 30, color: niceBlackColor);
const upgradeIcon = Icon(Icons.settings, size: 50, color: moneyCircleColor);
const rocketIcon = Icon(Icons.rocket_launch_outlined, size: 50, color: moneyCircleColor);
const boostIcon = Icon(Icons.double_arrow, size: 50, color: moneyCircleColor);
const emailIcon = Icon(Icons.mail_outlined);
const passwordIcon = Icon(Icons.lock_outline_rounded);
const passwordConfirmIcon = Icon(Icons.lock_open_outlined);
const nameIcon = Icon(Icons.person_outline_rounded);
const avatarIcon = Icon(Icons.account_circle_rounded, size: 200, color: cardColor);
//Upgrades
const apple = "assets/upgrades/apple.png";
const banana = "assets/upgrades/banana.png";
const pepper = "assets/upgrades/pepper.png";
const garlic = "assets/upgrades/garlic.png";
const mushroom = "assets/upgrades/mushroom.png";
const corn = "assets/upgrades/corn.png";
const bread = "assets/upgrades/bread.png";
const croissant = "assets/upgrades/croissant.png";
const fish = "assets/upgrades/fish.png";
const sushi = "assets/upgrades/sushi.png";
const meat = "assets/upgrades/meat.png";
const burger = "assets/upgrades/burger.png";
const donut = "assets/upgrades/donut.png";
const cake = "assets/upgrades/cake.png";
//Planet Upgrades

class PlanetUpgrades {
  static final planetUpgrades = <PlanetUpgrade>[
    PlanetUpgrade(
      image: "assets/ships/s1u0.png",
      name: "Mark-01",
      detail: "this item gets twice apple.",
      price: 1000.0,
      isAvailable: false,
    ),
  ];
}

class Upgrades {
  static final upgrades = <Upgrade>[
    Upgrade(
      image: apple,
      itemName: "Apple",
      itemEffect: "Each Apple Earns You",
      itemEffects: "Apple Earns You",
      price: 15,
      itemProfit: 0.1,
      itemCount: 0,
      isAvailable: false,
    ),
    Upgrade(
      image: banana,
      itemName: "Banana",
      itemEffect: "Each Banana Earns You",
      itemEffects: "Banana Earns You",
      price: 100,
      itemProfit: 1,
      itemCount: 0,
      isAvailable: false,
    ),
    Upgrade(
      image: pepper,
      itemName: "Pepper",
      itemEffect: "Each Pepper Earns You",
      itemEffects: "Pepper Earns You",
      price: 1100,
      itemProfit: 8,
      itemCount: 0,
      isAvailable: false,
    ),
    Upgrade(
      image: garlic,
      itemName: "Garlic",
      itemEffect: "Each Garlic Earns You",
      itemEffects: "Garlic Earns You",
      price: 12000,
      itemProfit: 47,
      itemCount: 0,
      isAvailable: false,
    ),
    Upgrade(
      image: mushroom,
      itemName: "Mushroom",
      itemEffect: "Each Mushroom Earns You",
      itemEffects: "Mushroom Earns You",
      price: 130000,
      itemProfit: 260,
      itemCount: 0,
      isAvailable: false,
    ),
    Upgrade(
      image: corn,
      itemName: "Corn",
      itemEffect: "Each Corn Earns You",
      itemEffects: "Corn Earns You",
      price: 1400000,
      itemProfit: 1400,
      itemCount: 0,
      isAvailable: false,
    ),
    Upgrade(
      image: bread,
      itemName: "Bread",
      itemEffect: "Each Bread Earns You",
      itemEffects: "Bread Earns You",
      price: 20000000,
      itemProfit: 7800,
      itemCount: 0,
      isAvailable: false,
    ),
    Upgrade(
      image: croissant,
      itemName: "Croissant",
      itemEffect: "Each Croissant Earns You",
      itemEffects: "Apple Croissant You",
      price: 330000000,
      itemProfit: 44000,
      itemCount: 0,
      isAvailable: false,
    ),
    Upgrade(
      image: fish,
      itemName: "Fish",
      itemEffect: "Each Fish Earns You",
      itemEffects: "Apple Fish You",
      price: 5100000000,
      itemProfit: 260000,
      itemCount: 0,
      isAvailable: false,
    ),
    Upgrade(
      image: sushi,
      itemName: "Sushi",
      itemEffect: "Each Sushi Earns You",
      itemEffects: "Sushi Earns You",
      price: 75000000000,
      itemProfit: 1600000,
      itemCount: 0,
      isAvailable: false,
    ),
    Upgrade(
      image: meat,
      itemName: "Meat",
      itemEffect: "Each Meat Earns You",
      itemEffects: "Meat Earns You",
      price: 1000000000000,
      itemProfit: 10000000,
      itemCount: 0,
      isAvailable: false,
    ),
    Upgrade(
      image: burger,
      itemName: "Burger",
      itemEffect: "Each Burger Earns You",
      itemEffects: "Burger Earns You",
      price: 14000000000000,
      itemProfit: 650000000,
      itemCount: 0,
      isAvailable: false,
    ),
    Upgrade(
      image: donut,
      itemName: "Donut",
      itemEffect: "Each Donut Earns You",
      itemEffects: "Donut Earns You",
      price: 170000000000000,
      itemProfit: 4300000000,
      itemCount: 0,
      isAvailable: false,
    ),
    Upgrade(
      image: cake,
      itemName: "Cake",
      itemEffect: "Each Cake Earns You",
      itemEffects: "Cake Earns You",
      price: 2100000000000000,
      itemProfit: 2900000000,
      itemCount: 0,
      isAvailable: false,
    ),
  ];
}
