import 'package:get/get.dart';

class UserController extends GetxController {
  final userName = ''.obs; // full name: "Alex Watson"
  final userFirstName = ''.obs; // just first name: "Alex"

  void setUser(String fullName) {
    userName.value = fullName;
    userFirstName.value = fullName.split(' ').first; // "Alex Watson" → "Alex"
  }
}
