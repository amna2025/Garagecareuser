import 'package:flutter/material.dart';

import 'package:garagecare/presentation/Profile/Location/AddNewLocation/suggestedAddress/suggestedaddress.dart';

class SuggestedAddressesSection extends StatelessWidget {
  final double headerHeight;
  final double mapHeight;

  const SuggestedAddressesSection({required this.headerHeight, required this.mapHeight});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: headerHeight + 72 + mapHeight - 240,
      left: 0,
      right: 0,
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
              ),
            ],
          ),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SuggestedAdress ()),
                  );
                },
                child: _buildAddressItem('Lorem ipsum address', context),
              ),
              _buildAddressItem('Lorem ipsum', context),
              _buildAddressItem('Lorem ipsum', context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddressItem(String address, BuildContext context) {
    return InkWell(
      onTap: () {
        print("Tapped on $address");
        if (address == 'Lorem ipsum address') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SuggestedAdress ()),
          );
        }
      },
      child: ListTile(
        leading: Icon(Icons.location_on),
        title: Text(address),
        trailing: Icon(Icons.add),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      ),
    );
  }
}
