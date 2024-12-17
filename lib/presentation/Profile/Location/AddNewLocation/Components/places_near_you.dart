import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garagecare/core/constants/app_colors.dart';

class PlacesNearYou extends StatelessWidget {
  final double bottomContainerHeight;

  const PlacesNearYou({required this.bottomContainerHeight});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: bottomContainerHeight,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 9.0),
                  child: SvgPicture.asset("assets/svgs/Line.svg"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 17.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset("assets/svgs/send2.svg"),
                    SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        'Share Your Current Location',
                        style: TextStyle(color: AppColors.mainColor),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(color: Colors.grey.shade300, indent: 18, endIndent: 18),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Places Near You',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 0),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: SvgPicture.asset("assets/svgs/Location4.svg"),
                      title: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Lorem Ipsum Address Is Used For The Address',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ),
                    ),
                    Divider(color: Colors.grey.shade300, indent: 0, endIndent: 0),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: SvgPicture.asset("assets/svgs/Location4.svg"),
                      title: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Lorem Ipsum Used For The Address',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ),
                    ),
                    Divider(color: Colors.grey.shade300, indent: 0, endIndent: 0),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: SvgPicture.asset("assets/svgs/Location4.svg"),
                      title: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Lorem; Ipsum Used For The Address',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
