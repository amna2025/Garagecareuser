import 'package:flutter/material.dart';
import 'package:garagecare/Riverpod/allservices_riverpod.dart';
import 'package:garagecare/core/constants/app_colors.dart';
import 'package:garagecare/customwidgets/customButton.dart';
import 'package:garagecare/presentation/Home/services/allservices/components/service_list_widget.dart';
import 'package:garagecare/presentation/Home/services/bookingservices/bookingScreen.dart';


class AddToCartButton extends StatelessWidget {
  final List<bool> selectedServices;
  final BuildContext context;
  final double screenWidth;

  const AddToCartButton({
    Key? key,
    required this.selectedServices,
    required this.context,
    required this.screenWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: 16),
      child: CustomButton(
        text: 'Add To Cart',
        height: 56,
        width: double.infinity,
        color: AppColors.mainColor,
        borderColor:AppColors.mainColor,
        borderWidth: 1,
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

            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Added to cart: ${selected.map((e) => e.name).join(', ')}"),
            ));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Please select at least one service.")),
            );
          }
        },
        borderRadius: 12.0,
        fontSize: 16,
        fontFamily: "Roboto",
        fontWeight: FontWeight.bold,
        fontColor: Colors.white,
      ),
    );
  }
}
