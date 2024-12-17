import 'package:flutter/material.dart';
import 'package:garagecare/core/constants/app_text.dart';
import 'package:garagecare/core/constants/constants.dart';
import 'package:garagecare/core/routes/app_routes.dart';
import 'package:garagecare/presentation/choose/components/custom_bottom.dart';
import 'package:garagecare/presentation/choose/components/custom_divider.dart';
import 'package:garagecare/presentation/choose/components/custom_logo.dart';
import 'package:garagecare/presentation/choose/components/custom_text.dart';

class ChooseScreen extends StatefulWidget {
  const ChooseScreen({super.key});

  @override
  State<ChooseScreen> createState() => _ChooseScreenState();
}

class _ChooseScreenState extends State<ChooseScreen> {
  DateTime? lastPressed;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async {
        final now = DateTime.now();
        if (lastPressed != null && now.difference(lastPressed!) <= const Duration(seconds: 2)) {
          return true; // Allow exit
        } else {
          lastPressed = now;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Press back again to exit')),
          );
          return false; // Prevent exit
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.08),
                CustomLogo(screenHeight: screenHeight, screenWidth: screenWidth),
                SizedBox(height: screenHeight * 0.025),
                CustomTextWidget(
                  text: AppText().let,
                  fontSize: screenWidth * 0.10,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                SizedBox(height: screenHeight * 0.03),
                CustomButtonWidget(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  text: AppText().google,
                  imagePath: AppImages.google,  // Update with your image path
                  onPressed: () {
                    print('Continue with Google');
                  },
                  textColor:AppColors.black,// Text color
                  buttonColor: Colors.grey.shade100, // Button background color
                ),
                SizedBox(height: screenHeight * 0.03),
                CustomButtonWidget(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  text: AppText().facebook,
                  imagePath: AppImages.facebook,
                  textColor:AppColors.black,
                  buttonColor:  Colors.grey.shade100,
                  onPressed: () => print('Continue with Facebook Selected'),
                ),
                SizedBox(height: screenHeight * 0.03),
                CustomButtonWidget(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  text: AppText().apple,
                  imagePath: AppImages.apple,
                  onPressed: () => print('Continue with Apple Selected'),
                  textColor: AppColors.black,
                  buttonColor:  Colors.grey.shade100,
                ),
                SizedBox(height: screenHeight * 0.09),
                CustomButtonWidget(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  text: AppText().signIn,
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, AppRoutes.signin);
                  },
                  textColor: Colors.white,
                  buttonColor: AppColors.mainColor,
                ),
                SizedBox(height: screenHeight * 0.03),
                DividerWithText(
                  screenWidth: screenWidth,
                  text: AppText().or,
                ),
                SizedBox(height: screenHeight * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextWidget(
                      text: AppText().dont,
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.normal,
                      color: AppColors.gray,
                    ),
                    SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, AppRoutes.signup);
                      },
                      child: CustomTextWidget(
                        text: AppText().signUp,
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.bold,
                        color: AppColors.mainColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
