import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garagecare/core/constants/app_colors.dart';
import 'package:garagecare/core/routes/app_routes.dart';
import 'package:garagecare/customwidgets/CustomText.dart';
import 'package:garagecare/presentation/Home/discount&subscription/discount&subscriptionScreen.dart';

class OnboardingCarousel extends StatelessWidget {
  final PageController pageController;
  final List<String> onboardingItems;
  final double screenWidth;

  const OnboardingCarousel({
    Key? key,
    required this.pageController,
    required this.onboardingItems,
    required this.screenWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context,AppRoutes.discount);
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.25,
        child: PageView.builder(
          controller: pageController,
          itemCount: onboardingItems.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(right: screenWidth * 0.01),
              padding: EdgeInsets.all(screenWidth * 0.04),
              width: screenWidth * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const LinearGradient(
                  colors: [Color(0xFF6571FF), Color(0xFF565B90)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: '05% OFF',
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,

                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Handle Get Coupon click
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.blue,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child:
                        CustomText(
                          text:  'GET COUPON',
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF565B90),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenWidth * 0.02),
                  CustomText(
                    text:  'LOREM IPSUM',
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                  SizedBox(height: screenWidth * 0.02),
                  CustomText(
                    text:  '• 05/08/2021 04:00 - 09/08/2021 12:00\n'
                        '• For all Oil Change services.\n'
                        '• Combinations: Get 20% off when you spend over \$169.00 or get 15% off when you spend over \$89.00.',
                    fontSize:screenWidth * 0.03,
                    color: AppColors.white,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
