import 'package:flutter/material.dart';
import '../../../core/app_colors.dart';
import '../../../core/app_strings.dart';

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
          AppStrings.signInToApp,
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        Text(
          AppStrings.appTitle,
          style: TextStyle(
            fontSize: 16,
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

class TextFieldWidget extends StatefulWidget {
  final String labelText;
  final String hintText;
  final Widget? icon;
  final bool isPassword;
  final bool obscureText;
  final VoidCallback? onToggleVisibility;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const TextFieldWidget({
    required this.labelText,
    required this.hintText,
    this.icon,
    this.isPassword = false,
    this.obscureText = false,
    this.onToggleVisibility,
    this.controller,
    this.validator,
    super.key,
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isFocused = _focusNode.hasFocus;
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.labelText,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: isFocused
                ? AppColors.textOrange.withValues(alpha: .2)
                : Colors.transparent,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.secondary,
              border: Border.all(
                color: isFocused ? AppColors.buttonOrange : Colors.transparent,
                width: 1,
              ),
            ),
            child: Row(
              children: [
                widget.icon ??
                    const Icon(Icons.person, color: AppColors.textPrimary),
                SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    controller: widget.controller,
                    focusNode: _focusNode,
                    validator: widget.validator,
                    obscureText: widget.obscureText,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      hintText: widget.hintText,
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                if (widget.isPassword)
                  IconButton(
                    icon: Icon(
                      widget.obscureText ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.textGrey,
                    ),
                    onPressed: widget.onToggleVisibility,
                  ),
              ],
            ),
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
    return Container(
      padding: EdgeInsets.zero,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.centerLeft,
          radius: 7,
          colors: [AppColors.buttonOrange, AppColors.textOrange],
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Text(
          labelText,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
