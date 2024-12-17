import 'package:flutter/material.dart';
import 'package:garagecare/core/constants/app_images.dart';

Widget LogoWidget(double screenWidth, double screenHeight) {
  return Container(
    width: screenWidth * 0.5,
    height: screenHeight * 0.22,
    child: Image.asset(AppImages.signinlogo),
  );
}
