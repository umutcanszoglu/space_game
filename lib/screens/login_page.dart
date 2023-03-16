import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:space_game/const/const.dart';
import 'package:space_game/screens/forgot_password_page.dart';
import 'package:space_game/screens/game_page.dart';
import 'package:space_game/screens/register_page.dart';
import 'package:space_game/widgets/login_button.dart';
import 'package:space_game/widgets/sign_with_buttons.dart';
import 'package:space_game/widgets/text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: niceBlackColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(height: 320, child: Lottie.asset("assets/lotties/loginPage.json")),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
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
                    const Text("Login",
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    const SizedBox(height: 16),
                    const MyTextField(icon: emailIcon, hintText: "Email", isObscure: false),
                    const SizedBox(height: 16),
                    const MyTextField(icon: passwordIcon, hintText: "Password", isObscure: true),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () => Get.to(const ForgotPasswordPage()),
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    LoginButton(buttonText: "Sign In", onTap: () => Get.to(const GamePage())),
                    const SizedBox(height: 4),
                    const Divider(color: niceBlackColor, thickness: 1.0),
                    const SizedBox(height: 4),
                    Row(
                      children: const [
                        Expanded(child: SignButtons(logo: "assets/logos/google.png")),
                        SizedBox(width: 10),
                        Expanded(child: SignButtons(logo: "assets/logos/apple.png")),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text("or"),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () => Get.to(const RegisterPage()),
                      child: const Text(
                        "SIGN UP",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
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
