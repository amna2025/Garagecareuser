import 'package:flutter/material.dart';
import 'package:garagecare/core/constants/constants.dart';
import 'package:garagecare/core/routes/app_routes.dart';



class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context,AppRoutes.trackingPage);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.mainColor,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text(
            'Go Track',
            style: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(height: 16),
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          label: const Text(
            'Back To Home',
            style: TextStyle(color: Colors.black),
          ),
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
