// see_more_text.dart
import 'package:flutter/material.dart';
import 'package:garagecare/core/constants/app_colors.dart';
import 'package:garagecare/customwidgets/CustomText.dart';

class SeeMoreText extends StatelessWidget {
  const SeeMoreText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomText(
            text: "See More",
            fontSize: 16,
            color: AppColors.gray,
          ),

        ],
      ),
    );
  }
}
