import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garagecare/presentation/Profile/Location/EditAddress/components/bottom_container.dart';
import 'package:garagecare/presentation/Profile/Location/EditAddress/components/circular_marker.dart';
import 'package:garagecare/presentation/Profile/Location/EditAddress/components/current_location_icon.dart';
import 'package:garagecare/presentation/Profile/Location/EditAddress/components/header.dart';
import 'package:garagecare/presentation/Profile/Location/EditAddress/components/search_container.dart';

class EditHomeAddressPage extends StatelessWidget {
  const EditHomeAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.network(
              'https://storage.googleapis.com/a1aa/image/wgqle8txftuqVEe7qyXJvbN8yZflo03JUdf7YfjlP0B9QVv5E.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Components
          HeaderEdit(size: size),
          SearchContainerEdit(size: size),
          const CircularMarker(),
          const CurrentLocationIcon(),
          const BottomContainer(),
        ],
      ),
    );
  }
}
