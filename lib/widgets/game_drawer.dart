import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:space_game/controllers/home_controller.dart';
import 'package:space_game/widgets/avatar.dart';
import 'package:space_game/widgets/drawer_container.dart';

import '../const/const.dart';

class GameDrawer extends StatelessWidget {
  const GameDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              gradient: const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  niceBlackColor,
                  cardColor,
                  niceBlackColor,
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Avatar(),
                const DrawerContainer(text: "Change Avatar"),
                const DrawerContainer(text: "Full Name"),
                const DrawerContainer(text: "Current Planet"),
                const DrawerContainer(text: "Your Progress"),
                const DrawerContainer(text: "Black Hole"),
                GestureDetector(
                  onTap: () {
                    controller.progress.value = 0.0;
                  },
                  child: const DrawerContainer(text: "Log Out", isChange: false),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
