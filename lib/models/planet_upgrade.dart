import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PlanetUpgrade {
  String image;
  String name;
  String detail;
  double price;
  bool isAvailable;
  int rank;
  bool isActive;
  PlanetUpgrade({
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

  factory PlanetUpgrade.fromMap(Map<String, dynamic> map) {
    return PlanetUpgrade(
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

  factory PlanetUpgrade.fromJson(String source) =>
      PlanetUpgrade.fromMap(json.decode(source) as Map<String, dynamic>);
}
