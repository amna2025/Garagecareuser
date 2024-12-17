import 'package:flutter/material.dart';

class CardholderNameField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Cardholder Name',
          style: TextStyle(fontSize: screenWidth * 0.04, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 5.0),
        TextField(
          decoration: InputDecoration(
            hintText: 'DummyName',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ],
    );
  }
}
