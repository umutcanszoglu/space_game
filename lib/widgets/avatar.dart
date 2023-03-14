import 'package:flutter/material.dart';

import '../const/const.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: const BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: avatarIcon,
    );
  }
}
