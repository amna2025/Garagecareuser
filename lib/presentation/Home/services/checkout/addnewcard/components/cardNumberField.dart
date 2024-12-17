import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardNumberField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Card Number',
          style: TextStyle(fontSize: screenWidth * 0.04, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 5.0),
        TextField(
          decoration: InputDecoration(
            hintText: '0000 0000 0000 0000',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset("assets/svgs/master.svg", height: 12),
            ),
          ),
        ),
      ],
    );
  }
}
