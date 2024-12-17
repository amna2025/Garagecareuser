import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garagecare/core/constants/app_colors.dart';


class BottomContainer extends StatelessWidget {
  const BottomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        decoration:  BoxDecoration(
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
              ListTile(
                leading: SvgPicture.asset("assets/svgs/send2.svg"),
                title: Text(
                  'Share Your Current Location',
                  style: TextStyle(color: AppColors.mainColor),
                ),
              ),
              Divider(color: Colors.grey.shade300),
              ListTile(
                leading: SvgPicture.asset("assets/svgs/Location4.svg"),
                title: const Text('Lorem Ipsum Address Is Used For The Address'),
              ),
              Divider(color: Colors.grey.shade300),
              ListTile(
                leading: SvgPicture.asset("assets/svgs/Location4.svg"),
                title: const Text('Lorem Ipsum Used For The Address'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
