import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/app_colors.dart';
import '../screens/signup_screen.dart';
import '../screens/widgets/auth_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/app_strings.dart';
import '../presentation/controllers/login_controller.dart';
import '../../core/utils/validators.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

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
                        labelText: AppStrings.emailAddress,
                        hintText: AppStrings.email,
                        controller: controller.emailController,
                        icon: SvgPicture.asset('assets/icons/email.svg'),
                        validator: Validators.email,
                      ),
                      SizedBox(height: 20),
                      Obx(
                        () => TextFieldWidget(
                          labelText: AppStrings.password,
                          hintText: AppStrings.password,
                          controller: controller.passwordController,
                          icon: SvgPicture.asset(
                            'assets/icons/lock password.svg',
                          ),
                          isPassword: true,
                          obscureText: !controller.isPasswordVisible.value,
                          onToggleVisibility:
                              controller.togglePasswordVisibility,
                          validator: Validators.password,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            AppStrings.forgotPassword,
                            style: TextStyle(
                              color: AppColors.textOrange,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.textOrange,
                              decorationThickness: 1.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 14),
                      Obx(
                        () => controller.isLoading.value
                            ? const CircularProgressIndicator()
                            : ButtonWidget(
                                labelText: AppStrings.signIn,
                                onPressed: controller
                                    .login, // <-- Call controller login
                              ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.dontHaveAnAccount,
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.off(() => const SignupScreen());
                    },
                    child: Text(
                      AppStrings.signUp,
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
