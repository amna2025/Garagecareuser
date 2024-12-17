
import 'package:flutter/material.dart';
import 'package:garagecare/presentation/Home/services/bookinginfo/components/action_buttons.dart';
import 'package:garagecare/presentation/Home/services/bookinginfo/components/content_section.dart';
import 'package:garagecare/presentation/Home/services/bookinginfo/components/header.dart';


class BookingInfoPage extends StatelessWidget {
  const BookingInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Header(),
          ContentSection(),
          ActionButtons(),
        ],
      ),
    );
  }
}
