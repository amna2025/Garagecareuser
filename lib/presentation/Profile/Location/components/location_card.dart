import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocationCard extends StatelessWidget {
  final String svgIconPath;
  final String title;
  final String address;
  final VoidCallback onEdit;

  LocationCard({
    required this.svgIconPath,
    required this.title,
    required this.address,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 3),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(9),
              ),
              height: 40,
              width: 42,
              child: SvgPicture.asset(
                svgIconPath,
                fit: BoxFit.scaleDown,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    address,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: onEdit,
              child: SvgPicture.asset("assets/svgs/edit2.svg"), // Keep the edit icon
            )
          ],
        ),
      ),
    );
  }
}
