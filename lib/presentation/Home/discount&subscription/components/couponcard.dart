
import 'package:flutter/material.dart';
import 'package:garagecare/core/constants/app_colors.dart';
import 'package:garagecare/customwidgets/CustomText.dart';

class CouponCard extends StatelessWidget {
  final String discount;
  final Color color;
  final LinearGradient? gradient;
  final String details;

  const CouponCard({super.key,
    required this.discount,
    required this.color,
    this.gradient,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 170,
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: gradient == null ? color : null,
          gradient: gradient,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text:  discount,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: color,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('GET COUPON'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            CustomText(
              text: details,
              fontSize: 12,
              color: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }
}



class CouponList extends StatelessWidget {
  final List<CouponCard> coupons;

  const CouponList({super.key, required this.coupons});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: coupons.length,
      itemBuilder: (context, index) {
        return coupons[index]; // Display each CouponCard
      },
    );
  }
}
