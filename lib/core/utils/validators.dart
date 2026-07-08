import 'package:get/get.dart';
import '../app_strings.dart';

class Validators {
  static String? email(String? val) {
    if (val == null || val.isEmpty) return AppStrings.emailIsRequired;
    if (!GetUtils.isEmail(val)) return AppStrings.enteraValidEmail;
    return null;
  }

  static String? password(String? val) {
    if (val == null || val.isEmpty) return AppStrings.passwordIsRequired;
    if (val.length < 6) return AppStrings.minimum6characters;
    return null;
  }

  static String? name(String? val) {
    if (val == null || val.isEmpty) return 'Name is required';
    if (val.length < 2) return 'Name must be at least 2 characters';
    return null;
  }

  static String? confirmPassword(String? val, String password) {
    if (val == null || val.isEmpty) return 'Confirm Password is required';
    if (val != password) return 'Passwords do not match';
    return null;
  }
}
