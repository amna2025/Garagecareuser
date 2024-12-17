import 'package:flutter/material.dart';
import 'package:garagecare/core/constants/app_colors.dart';
import 'package:garagecare/customwidgets/customText.dart';

class ServiceButton extends StatelessWidget {
  final String imagePath;
  final String title;
  final Function onTap;
  final bool isSelected;
  final double width;

  const ServiceButton({super.key,
    required this.imagePath,
    required this.title,
    required this.onTap,
    required this.isSelected,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        width: width,
        height: 44,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(13),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 8),
            Image.asset(imagePath),
            const SizedBox(width: 8),
            CustomText(
              text: title,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.white,

            ),
          ],
        ),
      ),
    );
  }
}

class ServiceButtonList extends StatelessWidget {
  final List<ServiceButton> serviceButtons;

  const ServiceButtonList({super.key, required this.serviceButtons});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Make the list scrollable horizontally
      child: Row(
        children: serviceButtons,
      ),
    );
  }
}
