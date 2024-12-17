import 'package:flutter/material.dart';

class MapContainer extends StatelessWidget {
  final double headerHeight;
  final double mapHeight;

  const MapContainer({required this.headerHeight, required this.mapHeight});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: headerHeight + 72,
      left: 0,
      right: 0,
      child: Container(
        height: mapHeight,
        width: double.infinity,
        // You can add a map widget here
      ),
    );
  }
}
