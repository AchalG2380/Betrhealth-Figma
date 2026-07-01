import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/app_colors.dart';
import '../screens/signin_screen.dart';
import '../screens/widgets/auth_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/app_strings.dart';
import '../presentation/controllers/signup_controller.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      AuthHeader(),
                      TextFieldWidget(
                        labelText: AppStrings.fullName,
                        hintText: AppStrings.name,
                        controller: controller.nameController,
                        icon: SvgPicture.asset("assets/icons/Group.svg"),
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Name is required';
                          }
                          if (val.length < 2) {
                            return 'Name must be at least 2 characters';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 14),
                      TextFieldWidget(
                        labelText: AppStrings.emailAddress,
                        hintText: AppStrings.email,
                        controller: controller.emailController,
                        icon: SvgPicture.asset("assets/icons/email.svg"),
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return AppStrings.emailIsRequired;
                          }
                          if (!val.contains('@')) return 'Invalid email';
                          return null;
                        },
                      ),
                      SizedBox(height: 14),
                      TextFieldWidget(
                        labelText: AppStrings.password,
                        hintText: AppStrings.password,
                        controller: controller.passwordController,
                        icon: SvgPicture.asset(
                          "assets/icons/lock password.svg",
                        ),
                        validator: (val) {
                          // <-- Add validation
                          if (val == null || val.isEmpty) {
                            return AppStrings.passwordIsRequired;
                          }
                          if (val.length < 6) {
                            return AppStrings.minimum6characters;
                          }
                          return null;
                        },
                        isPassword: true,
                      ),
                      SizedBox(height: 14),
                      TextFieldWidget(
                        labelText: AppStrings.confirmPassword,
                        hintText: AppStrings.password,
                        controller: controller.confirmPasswordController,
                        icon: SvgPicture.asset(
                          "assets/icons/lock password.svg",
                        ),
                        validator: (val) {
                          // <-- Add validation
                          if (val == null || val.isEmpty) {
                            return 'Confirm Password is required';
                          }
                          if (val != controller.passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                        isPassword: true,
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Obx(
                            () => Checkbox(
                              value: controller.isTermsAccepted.value,
                              onChanged: (value) {
                                controller.isTermsAccepted.value =
                                    value ?? false;
                              },
                              activeColor: AppColors.buttonOrange,
                              checkColor: AppColors.black,
                              side: BorderSide(
                                color: AppColors.buttonOrange,
                                width: 1,
                              ),
                            ),
                          ),
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
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Obx(
                        () => controller.isLoading.value
                            ? const CircularProgressIndicator()
                            : ButtonWidget(
                                labelText: AppStrings.register,
                                onPressed: controller.signup,
                              ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
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
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.off(() => const SigninScreen());
                    },
                    child: Text(
                      AppStrings.signIn,
                      style: TextStyle(
                        color: AppColors.textOrange,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.textOrange,
                        decorationThickness: 1.0,
                      ),
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
