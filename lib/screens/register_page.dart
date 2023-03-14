import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:space_game/const/const.dart';
import 'package:space_game/widgets/login_button.dart';
import 'package:space_game/widgets/text_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Lottie.asset("assets/register.json"),
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
                    const MyTextField(icon: nameIcon, hintText: "Full Name", isObscure: false),
                    const MyTextField(icon: emailIcon, hintText: "Email", isObscure: false),
                    const MyTextField(
                        icon: passwordIcon, hintText: "Create Password", isObscure: false),
                    const MyTextField(
                        icon: passwordConfirmIcon, hintText: "Password Confirm", isObscure: false),
                    LoginButton(buttonText: "Register", onTap: () {}),
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
