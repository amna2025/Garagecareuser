import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:garagecare/presentation/Profile/Location/AddNewLocation/addnewaddress.dart';
import 'package:garagecare/presentation/Profile/Location/AddNewLocation/suggestedAddress/components/confirmation_container.dart';
import 'package:garagecare/presentation/Profile/Location/AddNewLocation/suggestedAddress/components/location_indicator.dart';
import 'package:garagecare/presentation/Profile/Location/AddNewLocation/suggestedAddress/components/save_button.dart';
import 'package:garagecare/presentation/Profile/Location/AddNewLocation/suggestedAddress/components/search_container.dart';

import 'components/header.dart';

class SuggestedAdress extends StatefulWidget {
  @override
  _SuggestedAdressState createState() => _SuggestedAdressState();
}

class _SuggestedAdressState extends State<SuggestedAdress> {
  bool _isContainerVisible = false;

  void _showContainer() {
    setState(() {
      _isContainerVisible = true;
    });
  }

  void _hideContainer() {
    setState(() {
      _isContainerVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Image.network(
            'https://storage.googleapis.com/a1aa/image/wgqle8txftuqVEe7qyXJvbN8yZflo03JUdf7YfjlP0B9QVv5E.jpg',
            fit: BoxFit.cover,
            width: size.width,
            height: size.height,
          ),
          // Header container at the top
          Header(onBackPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AddNewAddressPage()),
            );
          }),
          // Search container
          SearchContainer(),
          // Center indicator (map-like position)
          LocationIndicator(),
          // Floating Action Button
          Positioned(
            bottom: 200,
            right: 16,
            child: FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.my_location),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
          ),
          // Save button
          SaveButton(onPressed: _showContainer),
          // Blurred background when save is pressed
          if (_isContainerVisible)
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          // Confirmation container that appears when save is pressed
          if (_isContainerVisible)
            ConfirmationContainer(onHideContainer: _hideContainer),
        ],
      ),
    );
  }
}
