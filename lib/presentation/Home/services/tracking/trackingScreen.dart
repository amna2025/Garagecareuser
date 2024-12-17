import 'package:flutter/material.dart';
import 'package:garagecare/presentation/Home/services/bookinginfo/components/header.dart';
import 'package:garagecare/presentation/Home/services/tracking/Components/tracking_content.dart';


class TrackingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Header(),
          TrackingContent(),
        ],
      ),
    );
  }
}
