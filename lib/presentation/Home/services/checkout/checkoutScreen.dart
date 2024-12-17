import 'dart:ui'; // Import for BackdropFilter
import 'package:flutter/material.dart';
import 'package:garagecare/Riverpod/allservices_riverpod.dart';
import 'package:garagecare/core/constants/app_colors.dart';
import 'package:garagecare/presentation/Home/services/checkout/components/booking_details_dialog.dart';
import 'package:garagecare/presentation/Home/services/checkout/components/bottom_action_button.dart';
import 'package:garagecare/presentation/Home/services/checkout/components/header.dart';
import 'package:garagecare/presentation/Home/services/checkout/components/payment_details.dart';
import 'package:garagecare/presentation/Home/services/checkout/components/service_list.dart';

class CheckoutScreen extends StatefulWidget {
  final List<ServicePackage> selectedServices; // List of selected services

  CheckoutScreen({required this.selectedServices});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final TextEditingController _hourController = TextEditingController();
  final TextEditingController _minuteController = TextEditingController();

  String _selectedPeriod = 'AM'; // Default to 'AM'

  @override
  void dispose() {
    _hourController.dispose();
    _minuteController.dispose();
    super.dispose();
  }

  void _togglePeriod(String period) {
    setState(() {
      _selectedPeriod = period;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Header(title: 'Checkout', onBack: () => Navigator.pop(context)),
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                children: [
                  ServiceList(services: widget.selectedServices),
                  SizedBox(height: 16),
                  PaymentDetails(selectedServices: widget.selectedServices),
                  SizedBox(height: 60),
                  BottomActionButton(
                    onPressed: () => _showBookingDetails(context),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showBookingDetails(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return BookingDetailsDialog(
          hourController: _hourController,
          minuteController: _minuteController,

        );
      },
    );
  }
}
