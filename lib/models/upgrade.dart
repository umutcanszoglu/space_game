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
  }) : initialPrice = price;

  double get passive => itemCount * itemProfit;
}
