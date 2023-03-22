import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lit_starfield/view/lit_starfield_container.dart';
import 'package:lottie/lottie.dart';
import 'package:space_game/const/const.dart';
import 'package:space_game/controllers/user_controller.dart';
import 'package:space_game/screens/forgot_password_page.dart';
import 'package:space_game/screens/register_page.dart';
import 'package:space_game/widgets/login_button.dart';
import 'package:space_game/widgets/sign_with_buttons.dart';
import 'package:space_game/widgets/text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());
    return Scaffold(
      backgroundColor: niceBlackColor,
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
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  SizedBox(height: 320, child: Lottie.asset("assets/lotties/loginPage.json")),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      // gradient: const LinearGradient(
                      //   begin: Alignment.topRight,
                      //   end: Alignment.bottomLeft,
                      //   colors: [
                      //     cardTitleColor,
                      //     subCardColor,
                      //     cardTitleColor,
                      //   ],
                      // ),
                      color: Colors.transparent,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: moneyCircleColor,
                          ),
                        ),
                        const SizedBox(height: 24),
                        MyTextField(
                          icon: emailIcon,
                          hintText: "Email",
                          isObscure: false,
                          controller: userController.loginEmail,
                        ),
                        const SizedBox(height: 16),
                        MyTextField(
                          icon: passwordIcon,
                          hintText: "Password",
                          isObscure: true,
                          controller: userController.loginPassword,
                        ),
                        const SizedBox(height: 16),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () => Get.to(const ForgotPasswordPage()),
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: moneyCircleColor,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        LoginButton(
                          buttonText: "Sign In",
                          onTap: () {
                            userController.signIn();
                          },
                        ),
                        const SizedBox(height: 4),
                        const Divider(color: moneyCircleColor, thickness: 1.0),
                        const SizedBox(height: 4),
                        Row(
                          children: const [
                            Expanded(child: SignButtons(logo: "assets/logos/google.png")),
                            SizedBox(width: 10),
                            Expanded(child: SignButtons(logo: "assets/logos/apple.png")),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "or",
                          style: TextStyle(color: moneyCircleColor),
                        ),
                        const SizedBox(height: 8),
                        GestureDetector(
                          onTap: () => Get.to(const RegisterPage()),
                          child: const Text(
                            "SIGN UP",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: moneyCircleColor,
                            ),
                          ),
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
