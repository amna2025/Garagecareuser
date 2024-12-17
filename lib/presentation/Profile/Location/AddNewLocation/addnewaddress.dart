import 'package:flutter/material.dart';
import 'package:garagecare/presentation/Profile/Location/AddNewLocation/Components/background_image.dart';
import 'package:garagecare/presentation/Profile/Location/AddNewLocation/Components/location_button.dart';
import 'package:garagecare/presentation/Profile/Location/AddNewLocation/Components/map_container.dart';
import 'package:garagecare/presentation/Profile/Location/AddNewLocation/Components/places_near_you.dart';
import 'package:garagecare/presentation/Profile/Location/AddNewLocation/Components/search_container..dart';
import 'package:garagecare/presentation/Profile/Location/AddNewLocation/Components/suggested_addresses_section.dart';



import 'Components/header.dart';
 // Import other pages if needed

class AddNewAddressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double headerHeight = screenSize.height * 0.12;
    final double mapHeight = screenSize.height * 0.3;
    final double bottomContainerHeight = screenSize.height * 0.3;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          BackgroundImage(),
          Header(headerHeight: headerHeight, screenSize: screenSize),
          SearchContainer(headerHeight: headerHeight),
          MapContainer(headerHeight: headerHeight, mapHeight: mapHeight),
          SuggestedAddressesSection(headerHeight: headerHeight, mapHeight: mapHeight),
          LocationButton(screenSize: screenSize),
          PlacesNearYou(bottomContainerHeight: bottomContainerHeight),
        ],
      ),
    );
  }
}
