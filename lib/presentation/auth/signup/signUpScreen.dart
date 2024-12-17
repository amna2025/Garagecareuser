import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garagecare/Riverpod/signup_riverpod.dart';
import 'package:garagecare/core/constants/app_colors.dart';
import 'package:garagecare/presentation/auth/signin/components/divider_with_text.dart';
import 'package:garagecare/presentation/auth/signin/components/social_media_buttons.dart';
import 'package:garagecare/presentation/auth/signup/components/sign_up_buttons.dart';
import 'package:garagecare/presentation/auth/signup/components/sign_up_form.dart';
import 'package:garagecare/presentation/auth/signup/components/sign_up_prompt.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Accessing the ViewModel from Riverpod
    final viewModel = ref.watch(signUpProvider);

    // Using MediaQuery to fetch screen size
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); // Dismiss keyboard on tap
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.04),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenSize.height * 0.06),
                Text(
                  "Create an account",
                  style: TextStyle(
                    fontSize: screenSize.width * 0.06,
                    color: AppColors.black,
                    fontFamily: "Roboto",
                  ),
                ),
                SizedBox(height: screenSize.height * 0.02),
                // Including the SignUpForm component
                SignUpForm(
                  viewModel: viewModel,
                  screenSize: screenSize,
                ),
                SizedBox(height: screenSize.height * 0.02),
                // Including the SignUpButtons component
                SignUpButtons(
                  viewModel: viewModel,
                  screenSize: screenSize,
                  context: context,
                ),
                SizedBox(height: screenSize.height * 0.05),
                DividerWithText(context),
                SizedBox(height: screenSize.height * 0.03),
                SocialMediaButtons(screenWidth),
                SizedBox(height: screenSize.height * 0.03),
                // Including the SignUpPrompt component
                SignUpPrompt(
                  viewModel: viewModel,
                  context: context,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
