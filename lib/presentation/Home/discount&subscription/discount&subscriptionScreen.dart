import 'package:flutter/material.dart';
import 'package:garagecare/core/constants/app_colors.dart';
import 'package:garagecare/customwidgets/CustomText.dart';

import 'components/DiscountPageHeader.dart';
import 'components/PaymentMethodContainer.dart';
import 'components/TabSwitcher.dart';
import 'components/couponcard.dart';
import 'components/subscriptionplan.dart';

class DiscountSubscriptionPage extends StatefulWidget {
  const DiscountSubscriptionPage({super.key});

  @override
  _DiscountSubscriptionPageState createState() => _DiscountSubscriptionPageState();
}

class _DiscountSubscriptionPageState extends State<DiscountSubscriptionPage> {
  bool showCoupons = true;
  bool isContainerOpen = false;
  bool isConfirmationVisible = false;


  void _toggleContainer() {
    setState(() {
      isContainerOpen = !isContainerOpen;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              DiscountPageHeader(onBackPressed: () => Navigator.pop(context)),
              const SizedBox(height: 10),
              TabSwitcher(showCoupons: showCoupons, onTabChanged: (value) {
                setState(() {
                  showCoupons = value;
                });
              }),
              Expanded(
                child: showCoupons
                    ? CouponList(coupons: _buildCouponList()) // Show coupon list
                    : SubscriptionList(plans: _buildSubscriptionPlans()), // Show subscription plans
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: _toggleContainer,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.mainColor,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),

                  child:const CustomText(
                    text: 'Apply',
                    fontSize: 18,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
          if (isContainerOpen)
            PaymentMethodContainer(
              onClose: _toggleContainer,

            ),
          if (isConfirmationVisible) ...[
            // Add confirmation UI here
          ],
        ],
      ),
    );
  }

  List<CouponCard> _buildCouponList() {
    // Sample coupons
    return [
      const CouponCard(
        discount: '05% OFF',
        color: AppColors.mainColor,
        gradient: LinearGradient(
          colors: [Color(0xFF6571FF), Color(0xFF565B90)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        details: '• 05/08/2021 04:00 - 09/08/2021 12:00\n'
            '• For all Oil Change services.\n'
            '• Combinations: Get 20% off when you spend over \$169.00 or get 15% off when you spend over \$89.00.',
      ),
      const CouponCard(
        discount: '12% OFF',
        color: AppColors.mainColor,
        gradient: LinearGradient(
          colors: [Color(0xFFC2524A), Color(0xFFA5332B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        details: '• 05/08/2021 04:00 - 09/08/2021 12:00\n'
            '• For all Oil Change services.\n'
            '• Combinations: Get 20% off when you spend over \$169.00 or get 15% off when you spend over \$89.00.',
      ),
      const CouponCard(
        discount: '04% OFF',
        color: AppColors.mainColor,
        gradient: LinearGradient(
          colors: [Color(0xFFE48507), Color(0xFFBB6F0B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        details: '• 05/08/2021 04:00 - 09/08/2021 12:00\n'
            '• For all Oil Change services.\n'
            '• Combinations: Get 20% off when you spend over \$169.00 or get 15% off when you spend over \$89.00.',
      ),
    ];
  }

  List<SubscriptionPlan> _buildSubscriptionPlans() {
    // Sample subscription plans
    return [
      const SubscriptionPlan(
        price: '\$10/Month',
        plan: 'Basic Plan',
        details: [
          '• 05/08/2021 04:00 - 09/08/2021 12:00\n'
              '• For all Oil Change services.\n'
              '• Combinations: Get 20% off when you spend over \$169.00 or get 15% off when you spend over \$89.00.',
        ],
        isSelected: true,
      ),
      const SubscriptionPlan(
        price: '\$20/Month',
        plan: 'Standard Plan',
        details: [],
        isSelected: false,
      ),
      const SubscriptionPlan(
        price: '\$35/Month',
        plan: 'Premium Plan',
        details: [],
        isSelected: false,
      ),
    ];
  }

  List<PaymentMethod> _buildPaymentMethods() {
    // Sample payment methods
    return [
      PaymentMethod(name: "Visa", cardType: "Credit Card"),
      PaymentMethod(name: "MasterCard", cardType: "Credit Card"),
      PaymentMethod(name: "PayPal", cardType: "Online Payment"),
    ];
  }
}
