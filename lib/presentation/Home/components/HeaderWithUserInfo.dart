import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:garagecare/core/constants/constants.dart';
import 'package:garagecare/customwidgets/CustomText.dart';
import 'package:garagecare/presentation/Home/Notification/notificationpage.dart';

class HeaderWithUserInfo extends StatelessWidget {
  final String username;
  const HeaderWithUserInfo({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(AppImages.userimage),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                  text:"Welcome",
                  fontSize: 15,
                  color: AppColors.gray,
                ),
                CustomText(
                  text:username,
                  fontSize: 18,
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,

                ),
              ],
            ),
          ],
        ),
        IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NotificationsPage()));
          },
          icon: SvgPicture.asset(AppSvgsImages.notification),
          padding: const EdgeInsets.all(1),
          constraints: const BoxConstraints(),
        ),
      ],
    );
  }
}
