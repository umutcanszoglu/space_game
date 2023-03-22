import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class GameSave {
  final double money;
  final int planetChanger;
  final int itemCount;
  final double itemPrice;
  final double itemProfit;
  final double upgradePrice;
  GameSave({
    required this.money,
    required this.planetChanger,
    required this.itemCount,
    required this.itemPrice,
    required this.itemProfit,
    required this.upgradePrice,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'money': money,
      'planetChanger': planetChanger,
      'itemCount': itemCount,
      'itemPrice': itemPrice,
      'itemProfit': itemProfit,
      'upgradePrice': upgradePrice,
    };
  }

  factory GameSave.fromMap(Map<String, dynamic> map) {
    return GameSave(
      money: map['money'] as double,
      planetChanger: map['planetChanger'] as int,
      itemCount: map['itemCount'] as int,
      itemPrice: map['itemPrice'] as double,
      itemProfit: map['itemProfit'] as double,
      upgradePrice: map['upgradePrice'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory GameSave.fromJson(String source) =>
      GameSave.fromMap(json.decode(source) as Map<String, dynamic>);
}
