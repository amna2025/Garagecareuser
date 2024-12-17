import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:garagecare/Riverpod/allservices_riverpod.dart';
import 'package:garagecare/core/constants/app_colors.dart';
import 'package:garagecare/presentation/Home/services/checkout/addnewcard/addnewcardScreen.dart';

class PaymentDetails extends StatelessWidget {
  final List selectedServices;

  const PaymentDetails({required this.selectedServices});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            spreadRadius: 1,
            offset: Offset(0, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.all(9.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPaymentHeader(),
          Divider(color: Colors.grey.shade300),
          _buildCardSelection(context),
          _buildPromoCodeField(),
        ],
      ),
    );
  }

  Widget _buildPaymentHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              child: SvgPicture.asset("assets/svgs/Shield Done.svg"),
            ),
            SizedBox(width: 8),
            Text(
              'Payment Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        SvgPicture.asset("assets/svgs/arrow2.svg"),
      ],
    );
  }

  Widget _buildCardSelection(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Select Card', style: TextStyle(fontWeight: FontWeight.w500)),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddNewCardScreen(
                      selectedServices: selectedServices.cast<ServicePackage>(), // Casting dynamically
                    ),
                  ),
                );

              },
              child: Text(
                'Add New Card',
                style: TextStyle(color: Colors.blue, fontSize: 13),
              ),
            ),
          ],
        ),
        DropdownButton<String>(
          isExpanded: true,
          underline: SizedBox(),
          value: 'Master Card',
          onChanged: (String? newValue) {},
          items: <String>['Master Card', 'Visa', 'Amex'].map((String card) {
            return DropdownMenuItem<String>(
              value: card,
              child: Row(
                children: [
                  if (card == 'Master Card')
                    SvgPicture.asset("assets/svgs/master.svg", height: 20),
                  if (card == 'Visa')
                    SvgPicture.asset("assets/svgs/master.svg", height: 20),
                  if (card == 'Amex')
                    SvgPicture.asset("assets/svgs/master.svg", height: 20),
                  SizedBox(width: 8),
                  Text(card),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildPromoCodeField() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Coupon/ Promo Code (optional)',
              style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),
            ),
            TextButton(
              onPressed: () {
                // Handle view coupons
              },
              child: Text(
                'View Coupons',
                style: TextStyle(fontSize: 13,
                    color: AppColors.mainColor
                ),
              ),
            ),
          ],
        ),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            hintText: 'Enter Coupon Or Promo Code',
          ),
        ),
      ],
    );
  }
}
