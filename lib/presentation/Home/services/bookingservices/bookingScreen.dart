import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garagecare/Riverpod/allservices_riverpod.dart';
import 'package:garagecare/core/constants/app_colors.dart';
import 'package:garagecare/presentation/Home/services/bookingservices/components/Brands%20Selection.dart';
import 'package:garagecare/presentation/Home/services/bookingservices/components/Continue%20Button.dart';
import 'package:garagecare/presentation/Home/services/bookingservices/components/Customer%20Details%20Section.dart';
import 'package:garagecare/presentation/Home/services/bookingservices/components/Delivery%20Details%20Section.dart';
import 'package:garagecare/presentation/Home/services/bookingservices/components/Header%20Section.dart';
import 'package:garagecare/presentation/Home/services/cart/cartScreen.dart';

class BookingScreen extends StatefulWidget {
  final List<ServicePackage> selectedServices;

  const BookingScreen({super.key, required this.selectedServices});

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  bool isSearchVisible = false;
  bool isCustomerDetailsVisible = false;
  bool isDeliveryDetailsVisible = false;
  String searchText = '';
  String selectedAddress = 'Address 1';
  TextEditingController departmentController = TextEditingController();
  TextEditingController optionalInfoController = TextEditingController();
  TextEditingController securityKeyController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  // List of brands with different images
  List<Map<String, String>> allBrands = [
    {'name': 'Tesla', 'image': 'assets/images/tesla.png'},
    {'name': 'BMW', 'image': 'assets/images/tesla.png'}, // Ensure you have a unique image here
    {'name': 'Audi', 'image': 'assets/images/tesla.png'}, // Ensure you have a unique image here
    {'name': 'Mercedes', 'image': 'assets/images/tesla.png'}, // Ensure you have a unique image here
    {'name': 'Ford', 'image': 'assets/images/tesla.png'}, // Ensure you have a unique image here
    // Add all your available brands here with unique images
  ];

  @override
  Widget build(BuildContext context) {
    // Filter brands based on the search text
    List<Map<String, String>> filteredBrands = allBrands
        .where((brand) => brand['name']!.toLowerCase().contains(searchText.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0), // Adjusted app bar height
        child: HeaderSection(onBackPressed: () {}),
      ),
      body: ListView(
        children: [
          BrandsSelectionSection(
            isSearchVisible: isSearchVisible,
            searchText: searchText,
            onSearchTextChanged: (text) {
              setState(() {
                searchText = text;
              });
            },
            filteredBrands: filteredBrands,
            onSearchToggle: () {
              setState(() {
                isSearchVisible = !isSearchVisible;
              });
            },
          ),
          CustomerDetailsSection(
            isVisible: isCustomerDetailsVisible,
            nameController: nameController,
            emailController: emailController,
            phoneController: phoneController,
            onToggleVisibility: () {
              setState(() {
                isCustomerDetailsVisible = !isCustomerDetailsVisible;
              });
            },
          ),
          DeliveryDetailsSection(
            isVisible: isDeliveryDetailsVisible,
            selectedAddress: selectedAddress,
            departmentController: departmentController,
            optionalInfoController: optionalInfoController,
            securityKeyController: securityKeyController,
            onAddressChanged: (address) {
              setState(() {
                selectedAddress = address!;
              });
            },
            onToggleVisibility: () {
              setState(() {
                isDeliveryDetailsVisible = !isDeliveryDetailsVisible;
              });
            },
          ),
          SizedBox(height: 16),
          // Continue button below Delivery Details
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total Amount", style: TextStyle(fontSize: 16)),

              Row(
                children: [
                  Text("P/hr", style: TextStyle(fontSize: 13,color: Colors.grey)),
                  SizedBox(width: 4,),
                  Text(
                    "\$159 ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color:AppColors.mainColor),
                  ),
                ],
              ),
            ],
          ),
          ContinueButton(onPressed: () {
            // Continue button logic here
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> CartScreen(selectedServices:widget.selectedServices)));
          }),
        ],
      ),
    );
  }
}
