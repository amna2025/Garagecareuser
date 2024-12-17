import 'package:flutter/material.dart';

class ServiceDetailAppBar extends StatelessWidget {
  final String serviceName;
  final double screenHeight;

  const ServiceDetailAppBar({super.key, required this.serviceName, required this.screenHeight});

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 400;
    return Container(
      height: screenHeight * 0.13,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.05),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context); // Go back to the previous screen
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: screenHeight * 0.01),
                child: Text(
                  serviceName, // Display dynamic service name here
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: isSmallScreen ? 18 : 21,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
