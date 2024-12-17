import 'package:flutter/material.dart';
import 'package:garagecare/core/constants/app_colors.dart';
import 'package:garagecare/core/constants/app_images.dart';
import 'package:garagecare/core/constants/app_text.dart';
import 'package:garagecare/core/routes/app_routes.dart';
import 'package:garagecare/presentation/choose/ChooseScreen.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to ChooseScreen after 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      print("Navigating to Choose Screen...");
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.choose, (Route<dynamic> route) => false,

      );  // Replace the splash screen with ChooseScreen
    });
  }
  @override
  Widget build(BuildContext context) {
    // Get the screen height and width
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.25),
            // Image with responsive width and height
            Image.asset(
             AppImages.splash,
              width: screenWidth * 0.2,
              height: screenWidth * 0.2,
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              AppText().garage,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: screenWidth * 0.09,
                fontWeight: FontWeight.bold,
                color: AppColors.secondary,
              ),
            ),
            SizedBox(height: screenHeight * 0.00),
            Text(
             AppText().lorem,
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.normal,
                  color:AppColors.blue
              ),
            ),
          ],
        ),
      ),
    );
  }
}
