import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garagecare/Riverpod/allservices_riverpod.dart';
import 'package:garagecare/CustomWidgets/serviceCard.dart' as cardWidgets;

class ServiceListWidget extends StatelessWidget {
  final List<bool> selectedServices;
  final WidgetRef ref;
  final double screenHeight;

  const ServiceListWidget({
    super.key,
    required this.selectedServices,
    required this.ref,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded( // Use Expanded for proper layout handling
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: servicePackages.length,
        itemBuilder: (context, index) {
          final service = servicePackages[index];
          return Padding(
            padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.007, // Responsive padding
            ),
            child: cardWidgets.ServiceCard(
              service: service,
              isSelected: selectedServices[index],
              onSelected: (bool? value) {
                ref.read(serviceSelectionProvider.notifier).toggleService(index);
              },
            ),
          );
        },
      ),
    );
  }
}

// Centralized list of services
final List<ServicePackage> servicePackages = [
  ServicePackage(
    id: '1',
    name: 'Basic Service',
    description:
    'Our Basic Service Package is the perfect solution for those who want to ensure their vehicle is in good condition.',
    price: 159.00,
    assetImageUrl: 'assets/images/car4.png',
  ),
  ServicePackage(
    id: '2',
    name: 'Full Service Package',
    description:
    'Our Full Service Package includes comprehensive checks and maintenance for your vehicle.',
    price: 279.00,
    assetImageUrl: 'assets/images/car4.png',
  ),
  ServicePackage(
    id: '3',
    name: 'Oil Change',
    description:
    'Regular oil changes are essential for maintaining the health of your engine.',
    price: 49.00,
    assetImageUrl: 'assets/images/car4.png',
  ),
];
