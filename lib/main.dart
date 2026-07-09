import 'package:betrhealth/core/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'auth/screens/signin_screen.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dashboard/screens/dashboard_screen.dart';
import 'core/services/database_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }
  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  Get.put(UserController());

  if (isLoggedIn) {
    final email = prefs.getString('userEmail');
    if (email != null) {
      final user = await DatabaseHelper.instance.getUserByEmail(email);
      if (user != null) {
        Get.find<UserController>().setUser(user.name);
      }
    }
  }

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Betrhealth",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(39, 22, 67, 1.0),
        ),
        fontFamily: 'MontserratAlternates',
      ),
      home: isLoggedIn ? const DashboardScreen() : const SigninScreen(),
    );
  }
}
