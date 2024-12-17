import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garagecare/Riverpod/allservices_riverpod.dart';
import 'package:garagecare/presentation/Home/services/checkout/addnewcard/components/CardDetailsWidget..dart';
import 'package:garagecare/presentation/Home/services/checkout/addnewcard/components/cardNumberField.dart';
import 'package:garagecare/presentation/Home/services/checkout/addnewcard/components/cardholderNameField.dart';
import 'package:garagecare/presentation/Home/services/checkout/addnewcard/components/expirationDateCVVRow.dart';
import 'package:garagecare/presentation/Home/services/checkout/addnewcard/components/saveCardCheckbox.dart';
import 'package:garagecare/presentation/Home/services/checkout/checkoutScreen.dart';


class AddNewCardScreen extends StatefulWidget {
  final List<ServicePackage> selectedServices;

  AddNewCardScreen({Key? key, required this.selectedServices}) : super(key: key);

  @override
  _AddNewCardScreenState createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  bool saveCardDetails = false;
  String expirationDate = 'Select Date';
  DateTime selectedDate = DateTime.now();
  TextEditingController expirationDateController = TextEditingController();

  void _showCustomDatePicker(BuildContext context) {
    // Your existing date picker implementation
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 110,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 5)],
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CheckoutScreen(selectedServices: widget.selectedServices),
                        ),
                      );
                    },
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Add New Card',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 21,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Column(
                children: [
                  CardDetailsWidget(expirationDate: expirationDate, screenWidth: screenWidth),
                  SizedBox(height: screenWidth * 0.05),
                  CardholderNameField(),
                  SizedBox(height: screenWidth * 0.05),
                  CardNumberField(),
                  SizedBox(height: screenWidth * 0.05),
                  ExpirationDateCVVRow(
                    expirationDateController: expirationDateController,
                    onDateTapped: () => _showCustomDatePicker(context),
                  ),
                  SizedBox(height: screenWidth * 0.05),
                  SaveCardCheckbox(
                    saveCardDetails: saveCardDetails,
                    onChanged: (bool? value) {
                      setState(() {
                        saveCardDetails = value!;
                      });
                    },
                  ),
                  SizedBox(height: screenWidth * 0.05), // Responsive size
                  // Save Button
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        print('Save action here'); // Implement save action here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.symmetric(
                            vertical: screenWidth * 0.04), // Responsive padding
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        'Save',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.045, // Responsive font size
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
