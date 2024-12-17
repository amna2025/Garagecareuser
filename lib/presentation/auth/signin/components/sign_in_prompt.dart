import 'package:flutter/material.dart';
import 'package:garagecare/core/constants/app_colors.dart';
import 'package:garagecare/core/routes/app_routes.dart';
import 'package:garagecare/customwidgets/customText.dart'; // Ensure this import is correct

Widget SignInPrompt(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.pushReplacementNamed(context, AppRoutes.signup);
    },
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          text: "Don't have an account?",
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.gray,
        ),
        CustomText(
          text: " Sign Up",
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.mainColor,
          decoration: TextDecoration.underline,
        ),
      ],
    ),
  );
}
