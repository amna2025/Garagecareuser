import 'package:flutter/material.dart';
import 'package:garagecare/core/constants/app_colors.dart';

class TabSwitcher extends StatelessWidget {
  final bool showCoupons;
  final ValueChanged<bool> onTabChanged;

  const TabSwitcher({super.key, required this.showCoupons, required this.onTabChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => onTabChanged(true),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border(
                    right: BorderSide(color: Colors.grey[300]!),
                    bottom: BorderSide(
                      color: showCoupons
                          ? AppColors.mainColor
                          : Colors.grey.shade300,
                      width: 2,
                    ),
                  ),
                ),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Coupons',
                        style: TextStyle(
                          color: showCoupons
                              ? AppColors.mainColor
                              : Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      if (showCoupons)
                        const Padding(
                          padding: EdgeInsets.only(left: 4.0),
                          child: Icon(
                            Icons.circle,
                            size: 6,
                            color: AppColors.mainColor,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => onTabChanged(false),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border(
                    bottom: BorderSide(
                      color: !showCoupons
                          ? AppColors.mainColor
                          : Colors.grey.shade300,
                      width: 2,
                    ),
                  ),
                ),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Subscription',
                        style: TextStyle(
                          color: !showCoupons
                              ?AppColors.mainColor
                              : Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      if (!showCoupons)
                        const Padding(
                          padding: EdgeInsets.only(left: 4.0),
                          child: Icon(
                            Icons.circle,
                            size: 6,
                            color: AppColors.mainColor,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
