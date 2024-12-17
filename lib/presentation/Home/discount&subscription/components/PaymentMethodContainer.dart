import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garagecare/core/constants/constants.dart';
import 'package:garagecare/customwidgets/CustomText.dart';
import 'package:garagecare/presentation/Home/discount&subscription/dialog/payment_confirmation_dialog.dart';


class PaymentMethod {
  final String name;
  final String cardType;

  PaymentMethod({required this.name, required this.cardType});
}

class PaymentMethodContainer extends StatefulWidget {
  final VoidCallback onClose; // onClose callback defined here

  const PaymentMethodContainer({super.key, required this.onClose});

  @override
  _PaymentMethodContainerState createState() => _PaymentMethodContainerState();
}

class _PaymentMethodContainerState extends State<PaymentMethodContainer> {
  String? _selectedPaymentMethod;

  Widget _buildPaymentMethodOption(
      String value,
      String title,
      String subtitle,
      String imageUrl,
      String set,
      String edit,
      ) {
    bool isSelected = _selectedPaymentMethod == value;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? Colors.blue : Colors.grey,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                imageUrl,
                width: 40,
                height: 40,
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: title,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? AppColors.blue : AppColors.black,
                  ),
                  CustomText(
                    text: subtitle,
                    fontSize: 16,
                    color: isSelected ? AppColors.blue : AppColors.gray,
                  ),
                ],
              ),
              const Spacer(),
              if (isSelected)
                SvgPicture.asset(AppSvgsImages.checkbox)
              else
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedPaymentMethod = value;
                    });
                  },
                  child: Container(
                    width: 24,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 50),
              TextButton(
                onPressed: () {
                  // Action for "Set as default"
                },
                child: Text(
                  set,
                  style: TextStyle(
                    color: isSelected ? Colors.blue : Colors.grey,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              TextButton(
                onPressed: () {
                  // Action for "Edit"
                },
                child: Text(
                  edit,
                  style: TextStyle(
                    color: isSelected ? Colors.blue : Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onClose, // Accessing 'onClose' from the 'widget' object
      child: Stack(
        children: [
          // Blue blurred background
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.blue.withOpacity(0.1),
            ),
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: 320,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Change your payment method',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'Update your plan payment details.',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    SizedBox(height: 16),

                    // 1st Payment Option: Visa
                    _buildPaymentMethodOption(
                      'Visa',
                      'Visa ending in 1234',
                      'Expiry 06/2024',
                      "assets/svgs/visa.svg",
                      "Set as default",
                      "Edit",
                    ),
                    _buildPaymentMethodOption(
                      'Mastercard',
                      'Mastercard ending in 1234',
                      'Expiry 06/2024',
                      'assets/svgs/master.svg',
                      "Set as default",
                      "Edit",
                    ),
                    _buildPaymentMethodOption(
                      'ApplePay',
                      'Visa ending in 1234',
                      'Expiry 06/2024',
                      'assets/svgs/visa.svg',
                      "Set as default",
                      "Edit",
                    ),

                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return PaymentConfirmationDialog(
                              onClose: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        minimumSize: const Size(double.infinity, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('Confirm', style: TextStyle(color: Colors.white)),
                    ),

                    const SizedBox(height: 8),
                    OutlinedButton(
                      onPressed: widget.onClose, // Accessing 'onClose' from the 'widget' object
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size(double.infinity, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('Back', style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Usage Example
List<PaymentMethod> methods = [
  PaymentMethod(name: "Visa", cardType: "Credit Card"),
  PaymentMethod(name: "MasterCard", cardType: "Credit Card"),
  PaymentMethod(name: "PayPal", cardType: "Online Payment"),
];
