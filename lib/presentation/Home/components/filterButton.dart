import 'package:flutter/material.dart';
import 'package:garagecare/core/constants/app_colors.dart';
import 'dart:ui';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:garagecare/core/constants/app_images.dart';
import 'package:garagecare/core/constants/app_svgs_images.dart';
import 'package:garagecare/customwidgets/CustomText.dart';

class FilterModal extends StatelessWidget {
  final bool isSmallScreen;

  const FilterModal({super.key, required this.isSmallScreen});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          width: isSmallScreen ? MediaQuery.of(context).size.width * 0.9 : 340,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'Filter',
                    fontSize: isSmallScreen ? 18 : 20,
                    fontWeight: FontWeight.bold,
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.grey),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 12),
              _buildPriceRange(isSmallScreen),
              const SizedBox(height: 16),
              _buildVehicleCharacteristics(isSmallScreen),
              const SizedBox(height: 8),
              _buildLocationDropdown(),
              const SizedBox(height: 16),
              _buildApplyButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPriceRange(bool isSmallScreen) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: 'Price Range',
          fontSize:  isSmallScreen ? 14 : 16,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.filter,
              height: isSmallScreen ? 35 : 50,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildVehicleCharacteristics(bool isSmallScreen) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text:  'Vehicle Characteristics',
          fontSize:  isSmallScreen ? 14 : 16,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(height: 8),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FilterButton(text: 'Air-Conditioning', isSelected: true),
            FilterButton(text: 'Automatic', isSelected: false),
            FilterButton(text: 'Manual', isSelected: false),
          ],
        ),
      ],
    );
  }

  Widget _buildLocationDropdown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      value: 'Location',
      items: ['Location'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Row(
            children: [
              SvgPicture.asset(AppSvgsImages.location),
              const SizedBox(width: 8),
              CustomText(
                text:  value,
                fontSize:  isSmallScreen ? 14 : 16,
                fontWeight: FontWeight.w300,
              ),

            ],
          ),
        );
      }).toList(),
      onChanged: (String? newValue) {},
      icon: SvgPicture.asset(AppSvgsImages.arrowDown),
    );
  }

  Widget _buildApplyButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.mainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12),
      ),
      child: Center(

        child:  CustomText(
          text: 'Apply',
          fontSize:  isSmallScreen ? 14 : 16,
          fontWeight: FontWeight.w300,
          color: AppColors.white,
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String text;
  final bool isSelected;

  const FilterButton({super.key, required this.text, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.mainColor : Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),

      child:  CustomText(
          text: text,
          fontSize:  12,
          color:isSelected ? Colors.white : Colors.black
      ),
    );
  }
}
