import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garagecare/core/constants/app_colors.dart';
import 'package:garagecare/presentation/Home/services/servicedetails/servicedetailsScreen.dart';

import '../Riverpod/allservices_riverpod.dart';


// Model class for service packages
class ServiceCard extends StatefulWidget {
  final ServicePackage service;
  final bool isSelected;
  final ValueChanged<bool?> onSelected;
  final bool showCheckbox;

  const ServiceCard({
    Key? key,
    required this.service,
    required this.isSelected,
    required this.onSelected,
    this.showCheckbox = true,
  }) : super(key: key);

  @override
  _ServiceCardState createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenSize = MediaQuery.of(context).size;
    final isMobile = screenSize.width < 600; // Adjust this threshold based on your needs

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: isMobile ? 8 : 16),
      child: Row(
        children: [
          if (widget.showCheckbox)
            Checkbox(
              value: widget.isSelected,
              onChanged: widget.onSelected,
              checkColor:Colors.white,
              fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return AppColors.mainColor; // Change this to your desired color when checked
                }
                return Colors.white; // Change this to your desired color when unchecked
              }),
            ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                // Navigate to the detailed screen when the card is clicked
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ServiceDetailPage(
                      serviceName: 'Oil Change',
                      imageUrl: widget.service.assetImageUrl ?? 'assets/images/default.png',
                    ),
                  ),
                );
              },
              child: Card(
                margin: EdgeInsets.zero,
                color: Colors.white,
                child: Container(
                  height: 130,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey.shade400,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        spreadRadius: 3,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(isMobile ? 8 : 12),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.service.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: isMobile ? 16 : 18,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              widget.service.description,
                              maxLines: isExpanded ? null : 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: isMobile ? 12 : 14),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isExpanded = !isExpanded;
                                });
                              },
                              child: Text(
                                isExpanded ? 'Show less' : 'Show more',
                                style: TextStyle(
                                  color: AppColors.mainColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '${widget.service.price.toStringAsFixed(2)} AED',
                              style: TextStyle(
                                color: AppColors.mainColor,
                                fontWeight: FontWeight.bold,
                                fontSize: isMobile ? 14 : 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Add a SizedBox for a consistent space between text and image
                      SizedBox(width: 8), // Space between text and image
                      Container(
                        width: isMobile ? 100 : 130, // Responsive width
                        height: isMobile ? 90 : 120, // Responsive height
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0), // Optional: round image corners
                          child: Image.asset(
                            widget.service.assetImageUrl ?? 'assets/images/default.png',
                            fit: BoxFit.cover, // Maintain aspect ratio
                          ),
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

