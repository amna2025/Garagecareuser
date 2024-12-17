import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:garagecare/core/constants/constants.dart';
import 'package:garagecare/customwidgets/CustomText.dart';

class SearchAndFilterBar extends StatelessWidget {
  final VoidCallback onFilterTap;
  const SearchAndFilterBar({super.key, required this.onFilterTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Image.asset(AppImages.search),
                const SizedBox(width: 10),
                const CustomText(
                  text:'Find your needed service',
                  fontSize: 16,
                  color: AppColors.black,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: onFilterTap,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(15),
            ),
            child: SvgPicture.asset(AppSvgsImages.filter),
          ),
        ),
      ],
    );
  }
}
