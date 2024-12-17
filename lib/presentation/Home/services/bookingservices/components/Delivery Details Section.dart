import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DeliveryDetailsSection extends StatelessWidget {
  final bool isVisible;
  final String selectedAddress;
  final TextEditingController departmentController;
  final TextEditingController optionalInfoController;
  final TextEditingController securityKeyController;
  final Function(String?) onAddressChanged;
  final VoidCallback onToggleVisibility;

   DeliveryDetailsSection({
    required this.isVisible,
    required this.selectedAddress,
    required this.departmentController,
    required this.optionalInfoController,
    required this.securityKeyController,
    required this.onAddressChanged,
    required this.onToggleVisibility,
  });

  // Define address options here
  final List<String> _addressOptions = [
    'Address 1',
    'Address 2',
    'Address 3',
    'Address 4',
    'Address 5',
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggleVisibility,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  height: 40,
                  width: 42,
                  alignment: Alignment.center,
                  child: SvgPicture.asset("assets/svgs/Location.svg"),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Text(
                    'Delivery Details',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Icon(
                  isVisible ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                ),
              ],
            ),
            if (isVisible) ...[
              SizedBox(height: 8),
              Divider(color: Colors.grey, thickness: 1),
              SizedBox(height: 8),
              Text(
                "Address",
                style: TextStyle(fontSize: 16),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: DropdownButton<String>(
                    value: selectedAddress,
                    hint: Text("Select Address"),
                    isExpanded: true,
                    underline: SizedBox(),
                    items: _addressOptions.map((String address) {
                      return DropdownMenuItem<String>(
                        value: address,
                        child: Text(address),
                      );
                    }).toList(),
                    onChanged: onAddressChanged,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Department/Flat Number",
                style: TextStyle(fontSize: 16),
              ),
              TextField(
                controller: departmentController,
                decoration: InputDecoration(
                  hintText: "Enter Department/Flat Number",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Any other Information (Optional)",
                style: TextStyle(fontSize: 16),
              ),
              TextField(
                controller: optionalInfoController,
                maxLines: 2,
                decoration: InputDecoration(
                  hintText: "Enter additional info here",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Security Key (Optional)",
                style: TextStyle(fontSize: 16),
              ),
              TextField(
                controller: securityKeyController,
                decoration: InputDecoration(
                  hintText: "Enter Security Key",
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
