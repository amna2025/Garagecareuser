import 'package:flutter/material.dart';

class ContentSection extends StatelessWidget {
  const ContentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
      child: Column(
        children: [
          Image.asset("assets/images/car-blue-0k2TVfRKu7.png"),
          const SizedBox(height: 16),
          const Text(
            'Successfully Add To Cart',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Lorem Ipsum is simply dummy text of the\n printing and typesetting industry.',
             textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
