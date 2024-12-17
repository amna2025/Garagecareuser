import 'package:flutter/material.dart';
import 'package:garagecare/Riverpod/signin_providers.dart';
import 'package:garagecare/core/constants/app_colors.dart';
import 'package:garagecare/core/routes/app_routes.dart';
import 'package:garagecare/customwidgets/customButton.dart';


Widget SignInButton(SignInViewModel viewModel, double screenHeight, double screenWidth, BuildContext context) {
  return CustomButton(
    text: viewModel.isLoading ? 'Signing In...' : 'Sign In',
    height: screenHeight * 0.07,
    width: 389,
    color: viewModel.isLoading ? Colors.grey :AppColors.mainColor,
    borderColor: AppColors.mainColor,
    borderWidth: 1,
    onPressed: () async {
      if (viewModel.isLoading) return; // Prevent multiple presses

      String? errorMessage = await viewModel.signIn();
      if (errorMessage != null) {
        Navigator.pushReplacementNamed(context,AppRoutes.entryPoint);
        return;
      } else {
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) => MainScreen()),
        // );
      }
    },
    borderRadius: 12.0,
    fontSize: screenWidth * 0.04,
    fontFamily: "Roboto",
    fontWeight: FontWeight.bold,
    fontColor: Colors.white,
  );
}
