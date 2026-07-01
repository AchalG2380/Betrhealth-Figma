import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/app_colors.dart';
import '../screens/signin_screen.dart';
import '../screens/widgets/auth_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/app_strings.dart';

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
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    AuthHeader(),
                    TextFieldWidget(
                      labelText: AppStrings.fullName,
                      hintText: AppStrings.name,
                      icon: SvgPicture.asset("assets/icons/Group.svg"),
                    ),
                    SizedBox(height: 10),
                    TextFieldWidget(
                      labelText: AppStrings.emailAddress,
                      hintText: AppStrings.email,
                      icon: SvgPicture.asset("assets/icons/email.svg"),
                    ),
                    SizedBox(height: 10),
                    TextFieldWidget(
                      labelText: AppStrings.password,
                      hintText: AppStrings.password,
                      icon: SvgPicture.asset("assets/icons/lock password.svg"),
                      isPassword: true,
                    ),
                    SizedBox(height: 10),
                    TextFieldWidget(
                      labelText: AppStrings.confirmPassword,
                      hintText: AppStrings.password,
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
                                  text: AppStrings.termsW,
                                  style: TextStyle(
                                    color: AppColors.textSecondary,
                                    fontSize: 12,
                                  ),
                                ),
                                TextSpan(
                                  text: AppStrings.termsO,
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
                    ButtonWidget(
                      labelText: AppStrings.register,
                      onPressed: () {},
                    ),
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
                    AppStrings.alreadyHaveAnAccount,
                    style: TextStyle(color: AppColors.textSecondary),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(() => const SigninScreen());
                    },
                    child: Text(
                      AppStrings.signIn,
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
