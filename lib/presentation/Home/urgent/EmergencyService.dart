import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garagecare/Riverpod/allservices_riverpod.dart';
import 'package:garagecare/presentation/Home/urgent/components/header_widget.dart';
import 'package:garagecare/presentation/Home/urgent/components/service_list_widget.dart';
import 'components/add_to_cart_button.dart';

class EmergencyServiceScreen extends StatefulWidget {
  final VoidCallback onNavigateBack;

  const EmergencyServiceScreen({super.key, required this.onNavigateBack});

  @override
  State<EmergencyServiceScreen> createState() => _EmergencyServiceScreenState();
}

class _EmergencyServiceScreenState extends State<EmergencyServiceScreen> {
  void onNavigateBack() {
    widget.onNavigateBack();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer(
        builder: (context, ref, child) {
          final selectedServices = ref.watch(serviceSelectionProvider);
          return Column(
            children: [
              HeaderWidget(
                onNavigateBack: onNavigateBack,
                screenHeight: screenHeight,
                screenWidth: screenWidth,
              ),
              SizedBox(height: screenHeight * 0.02),
              // Wrap the search bar in a SingleChildScrollView to prevent UI shift
              SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Container(
                  width: screenWidth * 0.9, // Adjust the width as needed
                  height: 45,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      hintStyle: TextStyle(
                        color: Colors.grey[600],
                      ),
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              ServiceListWidget(
                selectedServices: selectedServices,
                ref: ref,
                screenHeight: screenHeight,
              ),
              AddToCartButton(
                selectedServices: selectedServices,
                context: context,
                screenWidth: screenWidth,
              ),
            ],
          );
        },
      ),
    );
  }
}
