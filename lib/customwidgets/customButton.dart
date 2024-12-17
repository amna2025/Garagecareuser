import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final String? imagePath;
  final double height;
  final double width;
  final Color color;
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final double fontSize;
  final Color fontColor;
  final String? fontFamily;
  final FontWeight fontWeight;
  final double imageHeightFactor;
  final double imageWidthFactor;
  final VoidCallback? onPressed;          // Make onPressed nullable

  const CustomButton({
    Key? key,
    required this.text,
    this.imagePath,
    required this.height,
    required this.width,
    required this.color,
    required this.borderColor,
    required this.borderWidth,
    required this.borderRadius,
    required this.fontSize,
    required this.fontColor,
    this.fontFamily,
    this.fontWeight = FontWeight.normal,
    this.imageHeightFactor = 0.5,
    this.imageWidthFactor = 0.5,
    this.onPressed, // Optional, default null
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(
              color: borderColor,
              width: borderWidth,
            ),
          ),
        ),
        onPressed: onPressed, // Use the nullable onPressed
        child: Row(
          mainAxisAlignment: imagePath != null
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (imagePath != null) ...[
              SizedBox(width: 10),
              Image.asset(
                imagePath!,
                height: height * imageHeightFactor,
                width: height * imageWidthFactor,
              ),
              SizedBox(width: 25),
            ],
            Text(
              text,
              style: TextStyle(
                fontWeight: fontWeight,
                fontFamily: fontFamily,
                fontSize: fontSize,
                color: fontColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
