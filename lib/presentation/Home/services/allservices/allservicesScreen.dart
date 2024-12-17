import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garagecare/Riverpod/allservices_riverpod.dart';

import 'components/add_to_cart_button.dart';
import 'components/header_widget.dart';
import 'components/service_list_widget.dart';

class ServiceSelectionScreen extends StatefulWidget {
  final VoidCallback onNavigateBack;

  const ServiceSelectionScreen({super.key, required this.onNavigateBack});

  @override
  State<ServiceSelectionScreen> createState() => _ServiceSelectionScreenState();
}

class _ServiceSelectionScreenState extends State<ServiceSelectionScreen> {
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
