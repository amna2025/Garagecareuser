import 'package:flutter/material.dart';
import 'package:garagecare/Riverpod/allservices_riverpod.dart';
import 'package:garagecare/presentation/Home/services/bookingservices/bookingScreen.dart';


class AddToCartButton extends StatelessWidget {
  final List<bool> selectedServices;
  final List<ServicePackage> servicePackages;

  const AddToCartButton({super.key, required this.selectedServices, required this.servicePackages});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth * 0.9,
      padding: EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () {
          List<ServicePackage> selected = [];
          for (int i = 0; i < servicePackages.length; i++) {
            if (selectedServices[i]) {
              selected.add(servicePackages[i]);
            }
          }

          if (selected.isNotEmpty) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookingScreen(selectedServices: selected),
              ),
            );

            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      "Added to cart: ${selected.map((ServicePackage e) => e.name).join(', ')}"),
                ));
          }
        },
        child: Text(
          'Add To Cart',
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
