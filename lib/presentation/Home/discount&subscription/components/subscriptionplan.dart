
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:garagecare/core/constants/app_colors.dart';
import 'package:garagecare/customwidgets/CustomText.dart';

class SubscriptionPlan extends StatelessWidget {
  final String price;
  final String plan;
  final List<String> details;
  final bool isSelected;

  const SubscriptionPlan({super.key,
    required this.price,
    required this.plan,
    required this.details,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey[500]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text:  price,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    text: plan,
                    fontSize: 14,
                    color: AppColors.gray,
                  ),

                ],
              ),
              isSelected
                  ? SvgPicture.asset(
                'assets/svgs/arrow2.svg',
              )
                  : SvgPicture.asset(
                'assets/svgs/Union.svg', // Replace with your other SVG
              ),
            ],
          ),
          if (isSelected)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: details
                  .map(
                    (detail) => Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    detail,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF8B94B2),
                    ),
                  ),
                ),
              )
                  .toList(),
            ),
          if (isSelected)
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor:AppColors.mainColor,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Select',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }
}


class SubscriptionList extends StatelessWidget {
  final List<SubscriptionPlan> plans;

  const SubscriptionList({super.key, required this.plans});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: plans.length,
      itemBuilder: (context, index) {
        return plans[index]; // Display each SubscriptionPlan
      },
    );
  }
}
