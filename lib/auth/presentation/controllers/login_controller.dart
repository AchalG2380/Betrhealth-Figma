import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/services/database_helper.dart';
import '../../../dashboard/screens/dashboard_screen.dart';
import '../../../core/controllers/user_controller.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final isLoading = false.obs;
  final isPasswordVisible = false.obs;

  final formKey = GlobalKey<FormState>();
  final _db = DatabaseHelper.instance;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;

    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    // Query the database
    final user = await _db.getUser(email, password);

    isLoading.value = false;

    if (user != null) {
      // Store name globally
      final userCtrl = Get.find<UserController>();
      userCtrl.setUser(user.name);
      // Login success → go to dashboard
      Get.offAll(() => const DashboardScreen());
    } else {
      Get.snackbar(
        'Error',
        'Invalid email or password.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
