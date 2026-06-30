import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/app_colors.dart';
import '../screens/signin_screen.dart';
import '../screens/widgets/auth_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(14),
                child: Column(
                  children: [
                    AuthHeader(),
                    TextFieldWidget(
                      labelText: "Full Name",
                      hintText: "Name",
                      icon: SvgPicture.asset("assets/icons/Group.svg"),
                    ),
                    SizedBox(height: 10),
                    TextFieldWidget(
                      labelText: "Email Address",
                      hintText: "Email",
                      icon: SvgPicture.asset("assets/icons/email.svg"),
                    ),
                    SizedBox(height: 10),
                    TextFieldWidget(
                      labelText: "Password",
                      hintText: "Password",
                      icon: SvgPicture.asset("assets/icons/lock password.svg"),
                      isPassword: true,
                    ),
                    SizedBox(height: 10),
                    TextFieldWidget(
                      labelText: "Confirm Password",
                      hintText: "Password",
                      icon: SvgPicture.asset("assets/icons/lock password.svg"),
                      isPassword: true,
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Checkbox(value: false, onChanged: (value) {}),
                        Expanded(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "By continuing, you agree to our ",
                                  style: TextStyle(
                                    color: AppColors.textSecondary,
                                    fontSize: 12,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      "Terms &conditions, Privacy & Cookie Policy.",
                                  style: TextStyle(
                                    color: AppColors.textOrange,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 14),
                    ButtonWidget(labelText: "Register", onPressed: () {}),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(color: AppColors.textSecondary),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(() => const SigninScreen());
                    },
                    child: Text(
                      "Sign in",
                      style: TextStyle(color: AppColors.textOrange),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
