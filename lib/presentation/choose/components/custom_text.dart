import 'package:flutter/material.dart';
import 'package:garagecare/customwidgets/CustomText.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextDecoration decoration; // Added decoration parameter

  const CustomTextWidget({
    Key? key,
    required this.text,
    required this.fontSize,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
    this.decoration = TextDecoration.none, // Default value for decoration
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomText(
      text: text,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      decoration: decoration, // Passing decoration here
    );
  }
}
