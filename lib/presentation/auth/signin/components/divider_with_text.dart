import 'package:flutter/material.dart';
import 'package:garagecare/core/constants/constants.dart';

Widget DividerWithText(BuildContext context) {
  return const Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        width: 165,
        child: Divider(color: AppColors.gray),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Text("Or", style: TextStyle(color: AppColors.black)),
      ),
      SizedBox(
        width: 165,
        child: Divider(color: AppColors.gray),
      ),
    ],
  );
}
