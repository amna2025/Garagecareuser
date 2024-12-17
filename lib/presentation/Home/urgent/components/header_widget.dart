import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final VoidCallback onNavigateBack;
  final double screenHeight;
  final double screenWidth;

  const HeaderWidget({
    Key? key,
    required this.onNavigateBack,
    required this.screenHeight,
    required this.screenWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.12, // Make header height responsive
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.05), // Adjust padding
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: onNavigateBack,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: screenHeight * 0.01),
                child: Text(
                  'Emergency Service',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: screenWidth * 0.05, // Responsive text
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            // Search Container

          ],
        ),
      ),
    );
  }
}
