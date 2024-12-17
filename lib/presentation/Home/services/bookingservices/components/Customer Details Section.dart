import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomerDetailsSection extends StatelessWidget {
  final bool isVisible;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final VoidCallback onToggleVisibility;

  const CustomerDetailsSection({
    required this.isVisible,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.onToggleVisibility,
  });

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
                  child: SvgPicture.asset("assets/svgs/Profile.svg"),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Text(
                    'Customer Details',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Icon(Icons.arrow_drop_down),
              ],
            ),
            if (isVisible) ...[
              SizedBox(height: 8),
              Divider(color: Colors.grey, thickness: 1),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Name:", style: TextStyle(fontSize: 16)),
                  Flexible(
                    child: Text(
                      nameController.text.isEmpty ? "John Doe" : nameController.text,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Email:", style: TextStyle(fontSize: 16)),
                  Flexible(
                    child: Text(
                      emailController.text.isEmpty ? "john.doe@example.com" : emailController.text,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Phone Number:", style: TextStyle(fontSize: 16)),
                  Flexible(
                    child: Text(
                      phoneController.text.isEmpty ? "+123456789" : phoneController.text,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
