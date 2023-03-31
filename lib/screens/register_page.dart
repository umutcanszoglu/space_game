import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lit_starfield/view/lit_starfield_container.dart';
import 'package:lottie/lottie.dart';
import 'package:cosmic_clicker/const/const.dart';
import 'package:cosmic_clicker/controllers/user_controller.dart';
import 'package:cosmic_clicker/widgets/login_button.dart';
import 'package:cosmic_clicker/widgets/text_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Lottie.asset("assets/lotties/register.json"),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    width: double.infinity,
                    height: 435,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: Colors.transparent,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Create Account",
                          style: TextStyle(
                              color: moneyCircleColor, fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        MyTextField(
                          icon: emailIcon,
                          hintText: "Email",
                          isObscure: false,
                          controller: userController.email,
                        ),
                        MyTextField(
                          icon: passwordIcon,
                          hintText: "Create Password",
                          isObscure: true,
                          controller: userController.password,
                        ),
                        LoginButton(
                            buttonText: "Register",
                            onTap: () {
                              userController.addUser();
                            }),
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
