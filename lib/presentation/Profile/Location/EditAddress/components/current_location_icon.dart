import 'package:flutter/material.dart';

class CurrentLocationIcon extends StatelessWidget {
  const CurrentLocationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.6,
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
        child: const Icon(
          Icons.my_location,
          color: Colors.black,
          size: 30,
        ),
      ),
    );
  }
}
