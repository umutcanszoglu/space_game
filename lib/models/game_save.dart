import 'dart:convert';

import 'package:cosmic_clicker/models/planet_upgrade.dart';
import 'package:cosmic_clicker/models/ship_upgrade.dart';
import 'package:cosmic_clicker/models/upgrade.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class GameSave {
  final double money;
  final int planetChanger;
  final List<Upgrade> upgrades;
  final List<PlanetUpgrade> planetUpgrades;
  final List<ShipUpgrade> shipUpgrades;
  GameSave({
    required this.money,
    required this.planetChanger,
    required this.upgrades,
    required this.planetUpgrades,
    required this.shipUpgrades,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'money': money,
      'planetChanger': planetChanger,
      'upgrades': upgrades.map((x) => x.toMap()).toList(),
      'planetUpgrades': planetUpgrades.map((x) => x.toMap()).toList(),
      'shipUpgrades': shipUpgrades.map((x) => x.toMap()).toList(),
    };
  }

  factory GameSave.fromMap(Map<String, dynamic> map) {
    return GameSave(
      money: map['money'] as double,
      planetChanger: map['planetChanger'] as int,
      upgrades: List<Upgrade>.from(
        (map['upgrades'] as List<dynamic>).map<Upgrade>(
          (x) => Upgrade.fromMap(x as Map<String, dynamic>),
        ),
      ),
      planetUpgrades: List<PlanetUpgrade>.from(
        (map['planetUpgrades'] as List<dynamic>).map<PlanetUpgrade>(
          (x) => PlanetUpgrade.fromMap(x as Map<String, dynamic>),
        ),
      ),
      shipUpgrades: List<ShipUpgrade>.from(
        (map['shipUpgrades'] as List<dynamic>).map<ShipUpgrade>(
          (x) => ShipUpgrade.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory GameSave.fromJson(String source) =>
      GameSave.fromMap(json.decode(source) as Map<String, dynamic>);
}
