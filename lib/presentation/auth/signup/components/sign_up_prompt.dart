import 'package:flutter/material.dart';
import 'package:garagecare/Riverpod/signup_riverpod.dart';
import 'package:garagecare/core/constants/app_colors.dart';
import 'package:garagecare/core/routes/app_routes.dart';


class SignUpPrompt extends StatelessWidget {
  final SignUpViewModel viewModel;
  final BuildContext context;

  const SignUpPrompt({required this.viewModel, required this.context});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("You have an account?", style: TextStyle(color: Colors.grey)),
        TextButton(
          onPressed: () {
            viewModel.clearUsernameError();
            viewModel.clearEmailError();
            viewModel.clearPasswordError();
            viewModel.clearConfirmPasswordError();
            viewModel.usernameController.clear();
            viewModel.emailController.clear();
            viewModel.passwordController.clear();
            viewModel.confirmPasswordController.clear();
            Navigator.pushReplacementNamed(context, AppRoutes.signin);
          },
          child: Text("Sign In", style: TextStyle(color:AppColors.mainColor, decoration: TextDecoration.underline, fontSize: 14)),
        ),
      ],
    );
  }
}
