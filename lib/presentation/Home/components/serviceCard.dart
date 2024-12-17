import 'package:flutter/material.dart';
import 'package:garagecare/core/constants/app_colors.dart';
import 'package:garagecare/customwidgets/CustomText.dart';

class ServiceCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;

  const ServiceCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260, // Set total height for the card
      padding: const EdgeInsets.all(9.0), // Padding around the card
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image container with a fixed height
          Container(
            height: 174, // Fixed height for the image
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), // Rounded corners
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10), // Rounded corners for the image
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover, // Maintain aspect ratio
                width: double.infinity, // Responsive width
              ),
            ),
          ),
          const SizedBox(height: 8), // Space between image and title
          Padding(
            padding: const EdgeInsets.only(left: 6),

            child:CustomText(
              text:  title,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.black,

            ),
          ),
          // Space between title and price
          Padding(
            padding: const EdgeInsets.only(left: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text:   price,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.mainColor,

                ),

                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    decoration: BoxDecoration(
                      color:  AppColors.mainColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 37,
                    width: 42,
                    child: const Icon(Icons.arrow_forward, size: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
