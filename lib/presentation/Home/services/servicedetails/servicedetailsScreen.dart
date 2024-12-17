import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garagecare/Riverpod/allservices_riverpod.dart';
import 'package:garagecare/presentation/Home/services/allservices/components/service_list_widget.dart';
import 'package:garagecare/presentation/Home/services/servicedetails/components/ImageContainer.dart';
import 'package:garagecare/presentation/Home/services/servicedetails/components/add_to_cart_button.dart';
import 'package:garagecare/presentation/Home/services/servicedetails/components/service_description.dart';
import 'package:garagecare/presentation/Home/services/servicedetails/components/service_detail_appbar.dart';


class ServiceDetailPage extends ConsumerWidget {
  final String imageUrl;
  final String serviceName;

  const ServiceDetailPage({super.key, required this.imageUrl, required this.serviceName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serviceDetail = ref.watch(serviceDetailProvider);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer(
        builder: (context, ref, child) {
          final selectedServices = ref.watch(serviceSelectionProvider);
          return Column(
            children: [
              // AppBar Section
              ServiceDetailAppBar(serviceName: serviceName, screenHeight: screenHeight),

              // Scrollable Content Section
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Service Image Section
                        ImageContainer(imageUrl: imageUrl, screenHeight: screenHeight),

                        // Service Description Section
                        ServiceDescription(serviceDetail: serviceDetail, screenHeight: screenHeight, isSmallScreen: isSmallScreen),

                        // Add to Cart Button Section
                        AddToCartButton(selectedServices: selectedServices, servicePackages: servicePackages),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
