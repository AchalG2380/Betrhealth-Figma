import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/app_colors.dart';
import '../screens/signup_screen.dart';
import '../screens/widgets/auth_widgets.dart';
import '../../dashboard/screens/dashboard_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/app_strings.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

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
                      labelText: AppStrings.emailAddress,
                      hintText: AppStrings.email,
                      icon: SvgPicture.asset('assets/icons/email.svg'),
                    ),
                    SizedBox(height: 10),
                    TextFieldWidget(
                      labelText: AppStrings.password,
                      hintText: AppStrings.password,
                      icon: SvgPicture.asset('assets/icons/lock password.svg'),
                      isPassword: true,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          AppStrings.forgotPassword,
                          style: TextStyle(color: AppColors.textOrange),
                        ),
                      ),
                    ),
                    SizedBox(height: 14),
                    ButtonWidget(
                      labelText: AppStrings.signIn,
                      onPressed: () {
                        Get.to(() => const DashboardScreen());
                      },
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
                    AppStrings.dontHaveAnAccount,
                    style: TextStyle(color: AppColors.textSecondary),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(() => const SignupScreen());
                    },
                    child: Text(
                      AppStrings.signUp,
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
