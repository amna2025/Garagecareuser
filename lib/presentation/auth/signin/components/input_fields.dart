

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garagecare/Riverpod/signin_providers.dart';
import 'package:garagecare/core/constants/constants.dart';
import 'package:garagecare/customwidgets/customTextFormField.dart';

Widget InputFields(
    SignInViewModel viewModel, double screenWidth, double screenHeight, BuildContext context) {
  return Column(
    children: [
      _buildInputField(
        context,
        "User Name/Email",
        "Username or Email.",
        AppSvgsImages.signinprofile,
        viewModel.emailOrUsernameController,
        false,
        viewModel.emailOrUsernameError,
        viewModel.clearEmailOrUsernameError,
        screenWidth,
      ),
      SizedBox(height: screenHeight * 0.03),
      _buildInputField(
        context,
        "Password",
        "New Password",
        AppSvgsImages.signinpassword,
        viewModel.passwordController,
        true,
        viewModel.passwordError,
        viewModel.clearPasswordError,
        screenWidth,
      ),
    ],
  );
}
Widget _buildInputField(
    BuildContext context,
    String label,
    String hint,
    String iconPath,
    TextEditingController controller,
    bool obscureText,
    String? error,
    Function clearError,
    double screenWidth,
    ) {
  final borderColor = error != null ? Colors.red : Colors.grey;
  final backgroundColor = error != null ? Colors.red.withOpacity(0.1) : Colors.grey.shade100;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
          color: AppColors.black,
          fontSize: screenWidth * 0.04,
          fontWeight: FontWeight.w400,
        ),
      ),
      const SizedBox(height: 8),
      Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: borderColor, width: 1),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: CustomTextFormField(
          hintText: hint,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10.0), // Add padding if needed
            child: SvgPicture.asset(
              iconPath,
              color:Colors.grey,  // Icon color
              width: 20,            // Set width of the icon
              height: 20,           // Set height of the icon
            ),
          ),
          controller: controller,
          backgroundColor: Colors.transparent,
          borderColor: Colors.transparent,
          iconColor: Colors.grey,
          textColor: Colors.black,
          hintColor: Colors.grey,
          obscureText: obscureText,
          onChanged: (value) {
            if (error != null) {
              clearError();
            }
          },
        ),
      ),
      if (error != null) ...[
        const SizedBox(height: 8),
        Text(
          error,
          style: TextStyle(color: Colors.red, fontSize: screenWidth * 0.035),
        ),
      ],
    ],
  );
}
