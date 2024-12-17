import 'package:flutter/material.dart';
import 'package:garagecare/Riverpod/signup_riverpod.dart';
import 'package:garagecare/core/constants/app_colors.dart';
import 'package:garagecare/core/routes/app_routes.dart';
import 'package:garagecare/customwidgets/customButton.dart';

class SignUpButtons extends StatelessWidget {
  final SignUpViewModel viewModel;
  final Size screenSize;
  final BuildContext context;

  const SignUpButtons({required this.viewModel, required this.screenSize, required this.context});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
    SizedBox(
    height: screenSize.height * 0.07, // Responsive height for the button
      child: CustomButton(
        text: viewModel.isLoading ? 'Signing Up...' : "Sign Up",
        width:389,
        color: viewModel.isLoading ? Colors.grey :AppColors.mainColor,
        borderColor:AppColors.mainColor,
        borderWidth: 1,
        onPressed: () async {
          if (viewModel.isLoading) return; // Prevent multiple presses

          String? errorMessage = await viewModel.signUp();
          if (errorMessage != null) {
           Navigator.pushReplacementNamed(context,AppRoutes.entryPoint);
          } else {
            // Navigate to the next screen after successful sign-up
            // Navigator.pushReplacement(context, AppRoutes.home);
          }
        },
        borderRadius: 12.0,
        fontSize: screenSize.width * 0.04,
        fontFamily: "Roboto",
        fontWeight: FontWeight.bold,
        fontColor: Colors.white, height:  screenSize.height * 0.07,
      ),
    ),
      ],
    );
  }
}
