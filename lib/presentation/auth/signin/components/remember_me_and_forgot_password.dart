import 'package:flutter/material.dart';
import 'package:garagecare/Riverpod/signin_providers.dart';
import 'package:garagecare/core/constants/app_colors.dart';
import 'package:garagecare/customwidgets/customText.dart';

Widget RememberMeAndForgotPassword(SignInViewModel viewModel, BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Theme(
            data: Theme.of(context).copyWith(
              unselectedWidgetColor: Colors.white,
              checkboxTheme: const CheckboxThemeData(
                side: BorderSide(color: Colors.grey),
              ),
            ),
            child: Checkbox(
              value: viewModel.rememberMe,
              onChanged: (value) {
                viewModel.toggleRememberMe(value!);
              },
              fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return AppColors.mainColor;
                }
                return Colors.white;
              }),
            ),
          ),
          const CustomText(
            text: "Remember Me",
            fontSize: 14, // Adjust the font size as needed
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ],
      ),
      TextButton(
        onPressed: () {
          viewModel.emailOrUsernameController.clear();
          viewModel.passwordController.clear();
          // Navigator.pushNamed(context, '/forget');
        },
        child: const CustomText(
          text: "Forgot Password?",
          fontSize: 14, // Adjust the font size as needed
          fontWeight: FontWeight.normal,
          color: Colors.grey,
          decoration: TextDecoration.underline, // Underline the text
        ),
      ),
    ],
  );
}
