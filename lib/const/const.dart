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
const moneyCircleColor = Color(0xFFD6D6D6);
List<Color> upgradeColors = [
  Colors.purple,
  Colors.blue,
  Colors.yellow,
  Colors.green,
];

//Icons
const goBackIcon = Icon(Icons.arrow_back_ios, size: 30, color: niceBlackColor);
const upgradeIcon = Icon(Icons.double_arrow, size: 30, color: moneyCircleColor);
const rocketIcon = Icon(Icons.rocket_launch_outlined, size: 30, color: moneyCircleColor);
const boostIcon = Icon(Icons.rocket_launch_rounded, size: 30, color: moneyCircleColor);
const emailIcon = Icon(Icons.mail_outlined);
const passwordIcon = Icon(Icons.lock_outline_rounded);
const passwordConfirmIcon = Icon(Icons.lock_open_outlined);
const nameIcon = Icon(Icons.person_outline_rounded);
const avatarIcon = Icon(Icons.account_circle_rounded, size: 200, color: cardColor);
const miniAvatarIcon = Icon(Icons.person_outline_rounded, size: 40, color: moneyCircleColor);
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

//Planets
class Planets {
  static final planets = <String>[
    "assets/planets/g1p1.gif",
    "assets/planets/g1p2.gif",
    "assets/planets/g1p3.gif",
    "assets/planets/g1p4.gif",
    "assets/planets/g1p5.gif",
    "assets/planets/g1p6.gif",
    "assets/planets/g1p7.gif",
    "assets/planets/g1p8.gif",
    "assets/planets/g1p9.gif",
    "assets/planets/g1p10.gif",
    "assets/planets/g1p11.gif",
    "assets/planets/g1p12.gif",
    "assets/planets/g1p13.gif",
    "assets/planets/g1p14.gif",
    "assets/planets/g1p15.gif",
    "assets/planets/g1p16.gif",
    "assets/planets/g1p17.gif",
    "assets/planets/g1p18.gif",
    "assets/planets/g1p19.gif",
    "assets/planets/g1p20.gif",
    "assets/planets/g1p21.gif",
    "assets/planets/s1.gif",
    "assets/planets/g1.gif",
    "assets/planets/blackhole.gif",
  ];
}

class PlanetUpgrades {
  static final planetUpgrades = <PlanetUpgrade>[
    PlanetUpgrade(
      image: apple,
      name: "Mighty Apple",
      detail: "this item gets twice apple.",
      price: 50.0,
      isAvailable: false,
      rank: 0,
      isActive: true,
    ),
    PlanetUpgrade(
      image: banana,
      name: "Perfect Banana",
      detail: "this item gets twice banana.",
      price: 1000.0,
      isAvailable: false,
      rank: 0,
      isActive: false,
    ),
    PlanetUpgrade(
      image: pepper,
      name: "Hot Chili Pepper",
      detail: "this item gets twice pepper.",
      price: 11000.0,
      isAvailable: false,
      rank: 0,
      isActive: false,
    ),
    PlanetUpgrade(
      image: garlic,
      name: "Stinky Garlic",
      detail: "this item gets twice garlic.",
      price: 120000.0,
      isAvailable: false,
      rank: 0,
      isActive: false,
    ),
    PlanetUpgrade(
      image: mushroom,
      name: "Smurf's Mushroom",
      detail: "this item gets twice mushroom.",
      price: 1300000.0,
      isAvailable: false,
      rank: 0,
      isActive: false,
    ),
    PlanetUpgrade(
      image: corn,
      name: "Big Corn",
      detail: "this item gets twice corn.",
      price: 14000000.0,
      isAvailable: false,
      rank: 0,
      isActive: false,
    ),
    PlanetUpgrade(
      image: bread,
      name: "Stale Bread",
      detail: "this item gets twice bread.",
      price: 200000000.0,
      isAvailable: false,
      rank: 0,
      isActive: false,
    ),
    PlanetUpgrade(
      image: croissant,
      name: "French Croissant",
      detail: "this item gets twice croissant.",
      price: 3300000000.0,
      isAvailable: false,
      rank: 0,
      isActive: false,
    ),
    PlanetUpgrade(
      image: fish,
      name: "Fresh Fish",
      detail: "this item gets twice Fish.",
      price: 51000000000.0,
      isAvailable: false,
      rank: 0,
      isActive: false,
    ),
    PlanetUpgrade(
      image: sushi,
      name: "California Roll",
      detail: "this item gets twice sushi.",
      price: 750000000000.0,
      isAvailable: false,
      rank: 0,
      isActive: false,
    ),
    PlanetUpgrade(
      image: meat,
      name: "Pure Protein",
      detail: "this item gets twice meat.",
      price: 10000000000000.0,
      isAvailable: false,
      rank: 0,
      isActive: false,
    ),
    PlanetUpgrade(
      image: burger,
      name: "McDonalds's BigMac",
      detail: "this item gets twice burger.",
      price: 1400000000000000.0,
      isAvailable: false,
      rank: 0,
      isActive: false,
    ),
    PlanetUpgrade(
      image: donut,
      name: "Breakfast For Cops",
      detail: "this item gets twice donut.",
      price: 17000000000000000.0,
      isAvailable: false,
      rank: 0,
      isActive: false,
    ),
    PlanetUpgrade(
      image: cake,
      name: "Happy Birthday!!",
      detail: "this item gets twice cake.",
      price: 21000000000000000.0,
      isAvailable: false,
      rank: 0,
      isActive: false,
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
      isActive: true,
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
      isActive: false,
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
      isActive: false,
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
      isActive: false,
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
      isActive: false,
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
      isActive: false,
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
      isActive: false,
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
      isActive: false,
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
      isActive: false,
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
      isActive: false,
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
      isActive: false,
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
      isActive: false,
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
      isActive: false,
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
      isActive: false,
    ),
  ];
}
