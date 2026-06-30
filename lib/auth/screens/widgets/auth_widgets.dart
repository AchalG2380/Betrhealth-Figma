import 'package:flutter/material.dart';
import '../../../core/app_colors.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Image.asset('assets/images/logo.png', height: 150, width: 150),
        ),
        Text(
          "Sign In to Betrhealth",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        Text(
          "Your smart fitness journey starts here",
          style: TextStyle(fontSize: 14, color: AppColors.textPrimary),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  final String labelText;
  final String hintText;
  final Widget? icon;
  final bool isPassword;

  const TextFieldWidget({
    required this.labelText,
    required this.hintText,
    this.icon,
    this.isPassword = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            labelText,
            style: TextStyle(color: AppColors.textPrimary),
          ),
        ),
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.primary,
          ),
          child: Row(
            children: [
              icon ?? const Icon(Icons.person, color: AppColors.textPrimary),
              SizedBox(width: 5),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: hintText,
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: AppColors.textPrimary),
                  ),
                ),
              ),
              if (isPassword)
                IconButton(
                  icon: Icon(Icons.visibility, color: AppColors.textPrimary),
                  onPressed: () {},
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class ButtonWidget extends StatelessWidget {
  final String labelText;
  final VoidCallback onPressed;
  const ButtonWidget({
    super.key,
    required this.labelText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          labelText,
          style: TextStyle(color: AppColors.textPrimary, fontSize: 16),
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(25),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          backgroundColor: AppColors.buttonOrange,
        ),
      ),
    );
  }
}
