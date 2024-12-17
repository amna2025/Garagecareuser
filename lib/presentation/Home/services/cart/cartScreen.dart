import 'package:flutter/material.dart';
import 'package:garagecare/Riverpod/allservices_riverpod.dart';
import 'package:garagecare/presentation/Home/services/bookingservices/components/Header%20Section.dart';
import 'package:garagecare/presentation/Home/services/cart/components/service_list_section.dart';
import 'package:garagecare/presentation/Home/services/cart/components/total_amount_section.dart';


class CartScreen extends StatefulWidget {
  final List<ServicePackage> selectedServices;

  CartScreen({super.key, required this.selectedServices});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late List<ServicePackage> services;

  @override
  void initState() {
    super.initState();
    services = List.from(widget.selectedServices);
  }

  void removeService(int index) {
    setState(() {
      services.removeAt(index);
    });
  }

  double calculateTotalAmount() {
    double total = 0.0;
    for (var service in services) {
      total += service.price;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          HeaderSection(onBackPressed: () {  },),
          Expanded(
            child: services.isEmpty
                ? Center(child: Text('No services added to cart'))
                : ServiceListSection(
              services: services,
              removeService: removeService,
              screenWidth: screenWidth,
            ),
          ),
          if (services.isNotEmpty)
            TotalAmountSection(
              services: services,
              screenWidth: screenWidth,
            ),
        ],
      ),
    );
  }
}
