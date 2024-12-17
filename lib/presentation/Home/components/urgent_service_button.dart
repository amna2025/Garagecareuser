import 'package:flutter/material.dart';
import 'package:garagecare/core/constants/app_colors.dart';
import 'package:garagecare/core/routes/app_routes.dart';
import 'package:garagecare/customwidgets/CustomText.dart';


class UrgentServiceButton extends StatelessWidget {
  const UrgentServiceButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
       Navigator.pushNamed(context, AppRoutes.emergencyServiceScreen);
      },
      child: Container(
        width: 390,
        height: 44,
        padding: const EdgeInsets.symmetric(vertical: 1),
        decoration: BoxDecoration(
          color: const Color(0xFFEF6359),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/urgent.png"),
            const SizedBox(width: 8),
            const CustomText(
              text:'Urgent Service',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            )
          ],
        ),
      ),
    );
  }
}
