import 'package:flutter/material.dart';

class CircularMarker extends StatelessWidget {
  const CircularMarker({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        width: size.width * 0.25,
        height: size.width * 0.25,
        decoration: BoxDecoration(
          color: Colors.deepPurple.shade100,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Container(
            width: size.width * 0.1,
            height: size.width * 0.1,
            decoration: const BoxDecoration(
              color: Colors.deepPurple,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Container(
                width: size.width * 0.04,
                height: size.width * 0.04,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
