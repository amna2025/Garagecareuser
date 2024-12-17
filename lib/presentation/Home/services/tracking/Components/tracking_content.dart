import 'package:flutter/material.dart';

class TrackingContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Image.asset("assets/images/filter3.png"),
        SizedBox(height: 10),
        Image.asset("assets/images/car5.png", width: 345),
        Padding(
          padding: const EdgeInsets.all(26.0),
          child: Row(
            children: [
              Icon(Icons.circle, color: Colors.blue[500], size: 10),
              SizedBox(width: 8),
              Text('Your Work Has been started.'),
            ],
          ),
        ),
      ],
    );
  }
}
