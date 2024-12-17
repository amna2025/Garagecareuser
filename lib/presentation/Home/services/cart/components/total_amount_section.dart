import 'package:flutter/material.dart';
import 'package:garagecare/Riverpod/allservices_riverpod.dart';
import 'package:garagecare/core/constants/app_colors.dart';
import 'package:garagecare/presentation/Home/services/checkout/checkoutScreen.dart';


class TotalAmountSection extends StatelessWidget {
  const TotalAmountSection({
    Key? key,
    required this.services,
    required this.screenWidth,
  }) : super(key: key);

  final List<ServicePackage> services;
  final double screenWidth;

  double calculateTotalAmount() {
    double total = 0.0;
    for (var service in services) {
      total += service.price;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total Amount", style: TextStyle(fontSize: screenWidth * 0.04)),
              Row(
                children: [
                  Text("P/hr", style: TextStyle(fontSize: 13, color: Colors.grey)),
                  SizedBox(width: 4),
                  Text(
                    "\$${calculateTotalAmount()} ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color:AppColors.mainColor),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CheckoutScreen(selectedServices: services)),
                );
              },
              child: Text(
                'Checkout',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.mainColor,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
