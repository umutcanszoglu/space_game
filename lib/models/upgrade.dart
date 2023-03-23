import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class Upgrade {
  String image;
  String itemName;
  String itemEffect;
  String itemEffects;
  double price;
  double initialPrice;
  double itemProfit;
  int itemCount;
  bool isAvailable;
  bool isActive;

  Upgrade({
    required this.image,
    required this.itemName,
    required this.itemEffect,
    required this.itemEffects,
    required this.price,
    required this.itemProfit,
    required this.itemCount,
    required this.isAvailable,
    required this.isActive,
    this.initialPrice = -1,
  }) {
    if (initialPrice == -1) initialPrice = price;
  }

  double get passive => itemCount * itemProfit;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'itemName': itemName,
      'itemEffect': itemEffect,
      'itemEffects': itemEffects,
      'price': price,
      'initialPrice': initialPrice,
      'itemProfit': itemProfit,
      'itemCount': itemCount,
      'isAvailable': isAvailable,
      'isActive': isActive,
    };
  }

  factory Upgrade.fromMap(Map<String, dynamic> map) {
    return Upgrade(
      image: map['image'] as String,
      itemName: map['itemName'] as String,
      itemEffect: map['itemEffect'] as String,
      itemEffects: map['itemEffects'] as String,
      price: map['price'] as double,
      initialPrice: map['initialPrice'] as double,
      itemProfit: map['itemProfit'] as double,
      itemCount: map['itemCount'] as int,
      isAvailable: map['isAvailable'] as bool,
      isActive: map['isActive'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Upgrade.fromJson(String source) =>
      Upgrade.fromMap(json.decode(source) as Map<String, dynamic>);
}
