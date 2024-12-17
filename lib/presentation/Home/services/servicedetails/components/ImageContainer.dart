import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final String imageUrl;
  final double screenHeight;

  const ImageContainer({super.key, required this.imageUrl, required this.screenHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: screenHeight * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imageUrl), // You can change this to NetworkImage if it's a URL
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
