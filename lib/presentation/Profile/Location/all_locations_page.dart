import 'package:flutter/material.dart';
import 'package:garagecare/core/constants/app_colors.dart';
import 'package:garagecare/presentation/Profile/Location/AddNewLocation/addnewaddress.dart';
import 'package:garagecare/presentation/Profile/Location/EditAddress/EditHomeAddressPage.dart';
import 'package:garagecare/presentation/Profile/Location/components/location_card.dart';
// Assuming this file contains resource assets and color values.

class AllLocationsPage extends StatefulWidget {
  final VoidCallback onNavigateBack;
  const AllLocationsPage({super.key, required this.onNavigateBack});

  @override
  State<AllLocationsPage> createState() => _AllLocationsPageState();
}

class _AllLocationsPageState extends State<AllLocationsPage> {
  void onNavigateBack() {
    widget.onNavigateBack(); // Call the provided navigation function
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
        onNavigateBack(); // Navigate back to HomeScreen
        return false; // Prevent the default back action
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: screenHeight * 0.13, // 15% of screen height
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.05), // Adjust top padding
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.black),
                          onPressed: () {
                            onNavigateBack();
                          },
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            'All Locations',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: screenWidth * 0.05, // Responsive font size
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.01), // Adjust size between elements
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.05), // 5% of screen width
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Image.asset("assets/images/Search.png"),
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.01), // Adjust size between elements
              _buildLocationCard('Home', 'Lorem ipsum is a dummy address', 'assets/svgs/Home.svg', context),
              SizedBox(height: screenHeight * 0.01), // Adjust size between elements
              _buildLocationCard('Office', 'Lorem ipsum is a dummy address', 'assets/svgs/Work.svg', context),
              SizedBox(height: screenHeight * 0.01), // Adjust size between elements
              _buildLocationCard('Apartment', 'Lorem ipsum is a dummy address', 'assets/svgs/Chart.svg', context),
              SizedBox(height: screenHeight * 0.1), // Space before button
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.05), // 5% of screen width
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AddNewAddressPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.mainColor,
                    padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02), // Responsive vertical padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Add New Location',
                      style: TextStyle(fontSize: screenWidth * 0.04, color: Colors.white), // Responsive font size
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLocationCard(String title, String address, String svgIconPath, BuildContext context) {
    return LocationCard(
      svgIconPath: svgIconPath,
      title: title,
      address: address,
      onEdit: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EditHomeAddressPage()),
        );
      },
    );
  }
}
