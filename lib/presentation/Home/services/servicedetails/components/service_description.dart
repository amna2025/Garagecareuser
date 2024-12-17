import 'package:flutter/material.dart';
import 'package:garagecare/Riverpod/allservices_riverpod.dart';


class ServiceDescription extends StatelessWidget {
  final ServiceDetail serviceDetail;
  final double screenHeight;
  final bool isSmallScreen;

  const ServiceDescription({super.key, required this.serviceDetail, required this.screenHeight, required this.isSmallScreen});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Service name and price row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              serviceDetail.name, // Display service name dynamically
              style: TextStyle(
                color: Colors.grey,
                fontSize: isSmallScreen ? 14 : 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Text(
                  'P/hr',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: isSmallScreen ? 14 : 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\$${serviceDetail.price.toStringAsFixed(2)}',
                  // Use price from provider
                  style: TextStyle(
                    fontSize: isSmallScreen ? 18 : 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue, // Adjust color
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.01),

        // Availability & Details
        Row(
          children: [
            Icon(Icons.access_time, color: Colors.grey),
            SizedBox(width: 4),
            Text('24/7', style: TextStyle(color: Colors.grey)),
            SizedBox(width: 16),
          ],
        ),
        SizedBox(height: screenHeight * 0.02),

        // Service Description
        Text(
          'Service Description',
          style: TextStyle(
            fontSize: isSmallScreen ? 16 : 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: screenHeight * 0.01),
        Text(
          serviceDetail.description,
          // Use description from provider
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w500,
            fontSize: isSmallScreen ? 14 : 16,
            height: 1.5,
          ),
        ),
        SizedBox(height: screenHeight * 0.04), // Responsive space
      ],
    );
  }
}
