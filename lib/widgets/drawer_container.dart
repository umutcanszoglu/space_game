import 'package:flutter/material.dart';

import '../const/const.dart';

class DrawerContainer extends StatelessWidget {
  const DrawerContainer({super.key, required this.text, this.isChange = true});
  final String text;
  final bool isChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: isChange ? backgroundColor : cardButtonColor,
      ),
      child: Center(child: Text(text, style: const TextStyle(color: moneyCircleColor))),
    );
  }
}
