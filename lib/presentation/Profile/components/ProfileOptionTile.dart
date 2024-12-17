import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileOptionTile extends StatelessWidget {
  final String iconPath;
  final String title;
  final Function onTap;

  const ProfileOptionTile({
    super.key,
    required this.iconPath,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05, vertical: 8),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 68,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: ListTile(
            leading: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(9),
              ),
              height: 40,
              width: 42,
              alignment: Alignment.center,
              child: SvgPicture.asset(
                iconPath,
                height: 24,
                width: 24,
                color: Colors.black,
              ),
            ),
            title: Text(title),
            onTap: () => onTap(),
            tileColor: Colors.grey[100],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
