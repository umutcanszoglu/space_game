import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lit_starfield/view/lit_starfield_container.dart';
import 'package:lottie/lottie.dart';
import 'package:cosmic_clicker/const/const.dart';
import 'package:cosmic_clicker/controllers/auth_controller.dart';
import 'package:cosmic_clicker/controllers/user_controller.dart';
import 'package:cosmic_clicker/screens/forgot_password_page.dart';
import 'package:cosmic_clicker/screens/register_page.dart';
import 'package:cosmic_clicker/widgets/login_button.dart';
import 'package:cosmic_clicker/widgets/sign_with_buttons.dart';
import 'package:cosmic_clicker/widgets/text_field.dart';

class LoginPage extends GetView<AuthController> {
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
                          onTap: userController.signIn,
                        ),
                        const SizedBox(height: 4),
                        const Divider(color: moneyCircleColor, thickness: 1.0),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Expanded(
                                child: SignButtons(
                              logo: "assets/logos/google.png",
                              onTap: controller.signInWithGoogle,
                            )),
                            const SizedBox(width: 10),
                            Expanded(
                              child: SignButtons(
                                logo: "assets/logos/apple.png",
                                onTap: () {
                                  Get.dialog(
                                    AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(32)),
                                      actionsPadding: const EdgeInsets.only(bottom: 16),
                                      actionsAlignment: MainAxisAlignment.center,
                                      backgroundColor: moneyCircleColor,
                                      title: SizedBox(
                                          width: 200,
                                          height: 200,
                                          child: Image.asset("assets/logos/apple.png")),
                                      content: const Text(
                                        "Coming Soon",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
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
