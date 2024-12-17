import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garagecare/Riverpod/service.dart';
import 'package:garagecare/core/constants/app_colors.dart';
import 'package:garagecare/presentation/Profile/ServicesHistory/components/ServiceDetailsDialog.dart';
import 'package:garagecare/presentation/Profile/ServicesHistory/components/service_header.dart';
import 'package:garagecare/presentation/Profile/ServicesHistory/components/service_item.dart';

class ServiceHistoryPage extends ConsumerWidget {
  final VoidCallback onNavigateBack;

  const ServiceHistoryPage({super.key, required this.onNavigateBack});

  void _showServiceDetails(BuildContext context, String serviceType) {
    if (serviceType == 'Track Your Service') {
      // Open ServiceDetailsDialog for Track Your Service
      showDialog(
        context: context,
        barrierDismissible: true, // Make it dismissible by tapping outside
        builder: (BuildContext context) {
          return ServiceDetailsDialog(serviceType: 'Track Your Service');
        },
      );
    } else if (serviceType == 'Part Sells Service') {
      // Open ServiceDetailsDialog for Part Sells Service
      showDialog(
        context: context,
        barrierDismissible: true, // Make it dismissible by tapping outside
        builder: (BuildContext context) {
          return ServiceDetailsDialog(serviceType: 'Part Sells Service');
        },
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 600;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          ServiceHeader(onNavigateBack: onNavigateBack),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Upcoming',
                      style: TextStyle(
                        fontSize: isSmallScreen ? 14 : 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: ServiceItem(
                      svgPath: 'assets/svgs/Time Square.svg',
                      title: 'Track Your Service',
                      subtitle: 'Car Repair Service',
                      onTap: () => _showServiceDetails(context, 'Track Your Service'),
                    ),
                  ),
                  Divider(endIndent: 20, indent: 20, color: Colors.grey.shade300),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: ServiceItem(
                      svgPath: 'assets/svgs/flat.svg',
                      title: 'Part Sells Service',
                      subtitle: '19 July 2024 | 10:00AM',
                      onTap: () => _showServiceDetails(context, 'Part Sells Service'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: ServiceItem(
                      svgPath: 'assets/svgs/flat.svg',
                      title: 'Part Sells Service',
                      subtitle: '19 July 2024 | 10:00AM',
                      onTap: () => _showServiceDetails(context, 'Part Sells Service'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: ServiceItem(
                      svgPath: 'assets/svgs/flat.svg',
                      title: 'Part Sells Service',
                      subtitle: '19 July 2024 | 10:00AM',
                      onTap: () => _showServiceDetails(context, 'Part Sells Service'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: ServiceItem(
                      svgPath: 'assets/svgs/flat.svg',
                      title: 'Part Sells Service',
                      subtitle: '19 July 2024 | 10:00AM',
                      onTap: () => _showServiceDetails(context, 'Part Sells Service'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: ServiceItem(
                      svgPath: 'assets/svgs/flat.svg',
                      title: 'Part Sells Service',
                      subtitle: '19 July 2024 | 10:00AM',
                      onTap: () => _showServiceDetails(context, 'Part Sells Service'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: ServiceItem(
                      svgPath: 'assets/svgs/flat.svg',
                      title: 'Part Sells Service',
                      subtitle: '19 July 2024 | 10:00AM',
                      onTap: () => _showServiceDetails(context, 'Part Sells Service'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
