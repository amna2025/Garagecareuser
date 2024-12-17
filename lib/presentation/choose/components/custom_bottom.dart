import 'package:flutter/material.dart';
import 'package:garagecare/customwidgets/customButton.dart';

class CustomButtonWidget extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;
  final String text;
  final String? imagePath;
  final Function() onPressed;
  final Color textColor;
  final Color buttonColor;

  const CustomButtonWidget({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
    required this.text,
     this.imagePath,
    required this.onPressed,
    required this.textColor,
    required this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: text,
      imagePath: imagePath,
      height: screenHeight * 0.07,
      width: screenWidth * 0.9,
      color: buttonColor, // Set the button color dynamically
      borderColor: Colors.grey,
      borderWidth: 1,
      borderRadius: 12.0,
      fontSize: screenWidth * 0.04,
      fontFamily: "Roboto",
      fontWeight: FontWeight.bold,
      fontColor: textColor, // Set the text color dynamically
      onPressed: onPressed,
    );
  }
}
