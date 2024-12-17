import 'package:flutter/material.dart';
import 'package:garagecare/core/constants/app_colors.dart';


class CustomSwitchTile extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitchTile({
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        GestureDetector(
          onTap: () => onChanged(!value),
          child: Stack(
            alignment: value ? Alignment.centerRight : Alignment.centerLeft,
            children: [
              Container(
                height: 12,
                width: 40,
                decoration: BoxDecoration(
                  color: value ? AppColors.mainColor.withOpacity(0.4) : Colors.grey[400],
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              Positioned(
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
