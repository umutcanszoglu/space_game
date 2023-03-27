// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ShipUpgrade {
  String image;
  String name;
  String detail;
  double price;
  bool isAvailable;
  int rank;
  bool isActive;
  ShipUpgrade({
    required this.image,
    required this.name,
    required this.detail,
    required this.price,
    required this.isAvailable,
    required this.rank,
    required this.isActive,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'name': name,
      'detail': detail,
      'price': price,
      'isAvailable': isAvailable,
      'rank': rank,
      'isActive': isActive,
    };
  }

  factory ShipUpgrade.fromMap(Map<String, dynamic> map) {
    return ShipUpgrade(
      image: map['image'] as String,
      name: map['name'] as String,
      detail: map['detail'] as String,
      price: map['price'] as double,
      isAvailable: map['isAvailable'] as bool,
      rank: map['rank'] as int,
      isActive: map['isActive'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ShipUpgrade.fromJson(String source) =>
      ShipUpgrade.fromMap(json.decode(source) as Map<String, dynamic>);
}
