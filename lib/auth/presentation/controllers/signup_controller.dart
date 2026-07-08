import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/user_model.dart';
import '../../../../core/services/database_helper.dart';
import '../../screens/signin_screen.dart';
import '../../../core/utils/hash_utils.dart';

class SignupController extends GetxController {
  // Text controllers for each field
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Observable states
  final isLoading = false.obs;
  final isPasswordVisible = false.obs;
  final isConfirmPasswordVisible = false.obs;
  final isTermsAccepted = false.obs;

  // Form key for validation
  final formKey = GlobalKey<FormState>();

  final _db = DatabaseHelper.instance;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  Future<void> signup() async {
    // Step 1: validate all fields
    if (!formKey.currentState!.validate()) return;

    if (!isTermsAccepted.value) {
      Get.snackbar(
        'Required',
        'Please agree to the Terms & Conditions.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isLoading.value = true;

    final email = emailController.text.trim().toLowerCase();
    final hashedPassword = HashUtils.hashPassword(
      passwordController.text.trim(),
    );
    final name = nameController.text.trim();

    // Step 2: check if email already registered
    final exists = await _db.emailExists(email);
    if (exists) {
      isLoading.value = false;
      Get.snackbar(
        'Error',
        'This email is already registered.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // Step 3: save user to SQLite
    final user = UserModel(name: name, email: email, password: hashedPassword);
    final success = await _db.insertUser(user);

    isLoading.value = false;

    if (success) {
      Get.snackbar(
        'Success',
        'Account created! Please login.',
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.off(() => const SigninScreen());
    } else {
      Get.snackbar(
        'Error',
        'Something went wrong. Try again.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
