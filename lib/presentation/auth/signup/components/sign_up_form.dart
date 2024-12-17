import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garagecare/Riverpod/signup_riverpod.dart';
import 'package:garagecare/core/constants/app_colors.dart';
import 'package:garagecare/core/constants/app_svgs_images.dart';
import 'package:garagecare/customwidgets/customTextFormField.dart';

class SignUpForm extends StatelessWidget {
  final SignUpViewModel viewModel;
  final Size screenSize;

  const SignUpForm({required this.viewModel, required this.screenSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildInputField(
          context,
          "Username",
          "Enter your username",
          AppSvgsImages.signinprofile,
          viewModel.usernameController,
          false,
          viewModel.usernameError,
          viewModel.clearUsernameError,
        ),
        SizedBox(height: screenSize.height * 0.02),
        buildInputField(
          context,
          "Email",
          "Enter your email",
          AppSvgsImages.signupemail,
          viewModel.emailController,
          false,
          viewModel.emailError,
          viewModel.clearEmailError,
        ),
        SizedBox(height: screenSize.height * 0.02),
        buildInputField(
          context,
          "Password",
          "Enter your password",
          AppSvgsImages.signuplock,
          viewModel.passwordController,
          true,
          viewModel.passwordError,
          viewModel.clearPasswordError,
        ),
        SizedBox(height: screenSize.height * 0.02),
        buildInputField(
          context,
          "Confirm Password",
          "Re-enter your password",
          AppSvgsImages.signuplock,
          viewModel.confirmPasswordController,
          true,
          viewModel.confirmPasswordError,
          viewModel.clearConfirmPasswordError,
          confirmPassword: viewModel.passwordController.text.isNotEmpty &&
              viewModel.passwordController.text ==
                  viewModel.confirmPasswordController.text,
        ),
      ],
    );
  }

  Widget buildInputField(BuildContext context,
      String label,
      String hint,
      String iconPath,
      TextEditingController controller,
      bool obscureText,
      String? error,
      Function clearError, {
        bool? confirmPassword,
      }) {
    final screenSize = MediaQuery
        .of(context)
        .size; // Get screen size
    final borderColor = error != null
        ? Colors.red
        : (confirmPassword == true ? Colors.green : AppColors.gray);
    final backgroundColor = error != null
        ? Colors.red.withOpacity(0.1)
        : (confirmPassword == true ? Colors.green.withOpacity(0.1) : Colors.grey
        .shade100);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.black54,
            fontSize: screenSize.width * 0.04,
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
            prefixIcon: Container(
              width: 24,
              height: 24,
              alignment: Alignment.center,
              child: SvgPicture.asset(
                iconPath,
                width: 25,
                height: 25,
                color: AppColors.gray,
              ),
            ),
            controller: controller,
            backgroundColor: Colors.transparent,
            borderColor: Colors.transparent,
            iconColor: AppColors.gray,
            textColor: Colors.black,
            hintColor: AppColors.gray,
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
            style: TextStyle(
              color: Colors.red,
              fontSize: screenSize.width * 0.035,
            ),
          ),
        ],
        if (label == "Password") ...[
          const SizedBox(height: 4),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Password must be at least ",
                  style: TextStyle(
                      color: Colors.grey, fontSize: screenSize.width * 0.033),
                ),
                TextSpan(
                  text: "8 Characters, ",
                  style: TextStyle(
                      color: Colors.green, fontSize: screenSize.width * 0.033),
                ),
                TextSpan(
                  text: "and must contain at least a ",
                  style: TextStyle(
                      color: Colors.grey, fontSize: screenSize.width * 0.033),
                ),
                TextSpan(
                  text: "a Capital Letter, ",
                  style: TextStyle(
                      color: Colors.green, fontSize: screenSize.width * 0.033),
                ),
                TextSpan(
                  text: "a ",
                  style: TextStyle(
                      color: Colors.grey, fontSize: screenSize.width * 0.033),
                ),
                TextSpan(
                  text: "Number ",
                  style: TextStyle(
                      color: Colors.green, fontSize: screenSize.width * 0.033),
                ),
                TextSpan(
                  text: "and a ",
                  style: TextStyle(
                      color: Colors.grey, fontSize: screenSize.width * 0.033),
                ),
                TextSpan(
                  text: "Special Character.",
                  style: TextStyle(
                      color: Colors.green, fontSize: screenSize.width * 0.033),
                ),
              ],
            ),
          ),
        ],
        if (label == "Confirm Password") ...[
          const SizedBox(height: 4),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Password must be at least ",
                  style: TextStyle(
                      color: Colors.grey, fontSize: screenSize.width * 0.033),
                ),
                TextSpan(
                  text: "8 Characters",
                  style: TextStyle(
                      color: Colors.green, fontSize: screenSize.width * 0.033),
                ),
                TextSpan(
                  text: " and must contain the same letters as ",
                  style: TextStyle(
                      color: Colors.grey, fontSize: screenSize.width * 0.033),
                ),
                TextSpan(
                  text: "New Password.",
                  style: TextStyle(
                      color: Colors.green, fontSize: screenSize.width * 0.033),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}