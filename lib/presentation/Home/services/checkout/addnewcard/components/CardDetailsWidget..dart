import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardDetailsWidget extends StatelessWidget {
  final String expirationDate;
  final double screenWidth;

  CardDetailsWidget({required this.expirationDate, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.06),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFF9898), Color(0xFFE9A179)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'NILBANK',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 190),
              SvgPicture.asset("assets/svgs/Logo-1.svg")
            ],
          ),
          SizedBox(height: screenWidth * 0.07),
          Text(
            '**** **** **** 0329',
            style: TextStyle(
              color: Colors.white,
              fontSize: screenWidth * 0.06,
              letterSpacing: 2.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: screenWidth * 0.05),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Card Holder Name',
                    style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.035),
                  ),
                  Text(
                    'DummyName',
                    style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.040, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Expired Date',
                    style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.035),
                  ),
                  Text(
                    expirationDate,
                    style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.040, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(width: 20),
              Align(
                alignment: Alignment.bottomRight,
                child: SvgPicture.asset("assets/svgs/MasterCard1.svg"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
