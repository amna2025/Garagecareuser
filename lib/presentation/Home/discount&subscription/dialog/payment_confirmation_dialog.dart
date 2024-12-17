import 'package:flutter/material.dart';
import 'package:garagecare/core/constants/app_images.dart';
import 'dart:ui';

import 'package:garagecare/customwidgets/CustomText.dart';

class PaymentConfirmationDialog extends StatelessWidget {
  final VoidCallback? onClose;

  const PaymentConfirmationDialog({super.key, this.onClose});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClose,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          color: Colors.black.withOpacity(0.5),
          alignment: Alignment.center,
          child: Container(
            height: 800,
            padding: const EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width * 0.8, // Responsive width
            constraints: const BoxConstraints(maxHeight: 400), // Responsive height
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                Image.asset(
                  AppImages.done,// Replace with your asset path
                  height: 100,
                  width: 130,
                ),
                const SizedBox(height: 20),
                const CustomText(
                  text:'Congratulations!',
                  fontSize: 25,
                  fontWeight: FontWeight.w500,

                ),
                const SizedBox(height: 10),
                const Text(
                  'Your account is ready to use. You will be redirected to the Login Page in a few seconds.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
