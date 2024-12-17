import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image.network(
        'https://storage.googleapis.com/a1aa/image/wgqle8txftuqVEe7qyXJvbN8yZflo03JUdf7YfjlP0B9QVv5E.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}
