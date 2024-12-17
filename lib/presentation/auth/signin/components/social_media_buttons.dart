import 'package:flutter/material.dart';
import 'package:garagecare/core/constants/constants.dart';

Widget  SocialMediaButtons(double screenWidth) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _buildSocialMediaButton(AppImages.google, () {
        print("Google sign up pressed");
      }, screenWidth),
      _buildSocialMediaButton(AppImages.facebook, () {
        print("Facebook sign up pressed");
      }, screenWidth),
      _buildSocialMediaButton(AppImages.apple, () {
        print("Apple sign up pressed");
      }, screenWidth),
    ],
  );
}
Widget _buildSocialMediaButton(String iconPath, Function onPressed, double screenWidth) {
  return GestureDetector(
    onTap: () => onPressed(),
    child: Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey.shade200,
      ),
      child: Image.asset(
        iconPath,
        height: screenWidth * 0.08,
        width: screenWidth * 0.15,
      ),
    ),
  );
}