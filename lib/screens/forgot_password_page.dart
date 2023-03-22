import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lit_starfield/view/lit_starfield_container.dart';
import 'package:lottie/lottie.dart';
import 'package:space_game/controllers/user_controller.dart';

import '../const/const.dart';
import '../widgets/login_button.dart';
import '../widgets/text_field.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          const LitStarfieldContainer(
            animated: true,
            velocity: 0.9,
            backgroundDecoration: BoxDecoration(
              color: niceBlackColor,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Lottie.asset("assets/lotties/forgot.json"),
                  const SizedBox(height: 32),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: Colors.transparent,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Forgot Password",
                          style: TextStyle(
                              color: moneyCircleColor, fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Enter your email and we'll send you a link ro reset your password.",
                          style: TextStyle(color: moneyCircleColor, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        MyTextField(
                          icon: emailIcon,
                          hintText: "Email",
                          isObscure: false,
                          controller: userController.resetEmail,
                        ),
                        const SizedBox(height: 8),
                        LoginButton(
                          buttonText: "Continue",
                          onTap: userController.resetPassword,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
