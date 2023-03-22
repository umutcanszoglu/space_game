import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:space_game/const/const.dart';
import 'package:space_game/controllers/user_controller.dart';
import 'package:space_game/widgets/login_button.dart';
import 'package:space_game/widgets/text_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
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
                  gradient: const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      cardTitleColor,
                      subCardColor,
                      cardTitleColor,
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "Create Account",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    MyTextField(
                      icon: nameIcon,
                      hintText: "Full Name",
                      isObscure: false,
                      controller: userController.fullName,
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
    );
  }
}
