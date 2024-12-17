import 'package:flutter/material.dart';
import 'package:garagecare/core/constants/app_images.dart';

class CustomLogo extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;

  const CustomLogo({Key? key, required this.screenHeight, required this.screenWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        AppImages.logo, // Update with the correct logo path
        width: screenWidth * 0.5,
        height: screenHeight * 0.2,
      ),
    );
  }
}
