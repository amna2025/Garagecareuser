import 'package:flutter/material.dart';

class BottomActionButton extends StatelessWidget {
  final VoidCallback onPressed;

  const BottomActionButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth > 400 ? 340 : screenWidth * 0.9,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          'Book Now',
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
