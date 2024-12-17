import 'package:flutter/material.dart';

Widget DividerWithText(BuildContext context) {
  return const Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        width: 165,
        child: Divider(color: Colors.grey),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Text("Or", style: TextStyle(color: Colors.blue)),
      ),
      SizedBox(
        width: 165,
        child: Divider(color: Colors.grey),
      ),
    ],
  );
}
