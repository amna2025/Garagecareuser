import 'package:flutter/material.dart';
import 'package:garagecare/core/constants/app_colors.dart';
import 'package:garagecare/customwidgets/CustomText.dart';

class DividerWithText extends StatelessWidget {
  final double screenWidth;
  final String text;

  const DividerWithText({Key? key, required this.screenWidth, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 19, right: 19),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: Colors.grey,
              thickness: 1,
              indent: screenWidth * 0.01,
              endIndent: screenWidth * 0.02,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CustomText(
              text: text,
              fontSize: screenWidth * 0.035,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          Expanded(
            child: Divider(
              color: Colors.grey,
              thickness: 1,
              indent: screenWidth * 0.01,
              endIndent: screenWidth * 0.01,
            ),
          ),
        ],
      ),
    );
  }
}
