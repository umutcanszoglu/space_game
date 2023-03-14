import 'package:flutter/material.dart';
import 'package:neopop/neopop.dart';

class MainButtons extends StatelessWidget {
  const MainButtons({super.key, required this.onTap, required this.icon});
  final Function() onTap;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return NeoPopButton(
      color: const Color(0xff0b0c0b),
      bottomShadowColor: const Color(0xff3d5f14),
      rightShadowColor: const Color(0xff628c36),
      buttonPosition: Position.fullBottom,
      onTapUp: onTap,
      border: Border.all(
        color: Colors.green,
        width: 1,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
        child: icon,
      ),
    );
  }
}
