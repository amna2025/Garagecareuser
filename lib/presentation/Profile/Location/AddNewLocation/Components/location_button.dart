import 'package:flutter/material.dart';

class LocationButton extends StatelessWidget {
  final Size screenSize;

  const LocationButton({required this.screenSize});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: screenSize.height - 330,
      right: 16,
      child: Container(
        width: 52,
        height: 52,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Icon(
          Icons.my_location,
          color: Colors.black,
          size: 30,
        ),
      ),
    );
  }
}
