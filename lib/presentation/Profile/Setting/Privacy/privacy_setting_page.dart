import 'package:flutter/material.dart';

import 'components/custom_switch_tile.dart';
import 'components/notification_tile.dart';

class PrivacySettingPage extends StatefulWidget {
  final VoidCallback onNavigateBack;

  const PrivacySettingPage({super.key, required this.onNavigateBack});

  @override
  State<PrivacySettingPage> createState() => _PrivacySettingPageState();
}

class _PrivacySettingPageState extends State<PrivacySettingPage> {
  void onNavigateBack() {
    widget.onNavigateBack(); // Call the provided navigation function
  }

  bool allNotifications = true;
  bool emailNotifications = true;
  bool smsNotifications = true;
  bool updatesNotifications = true;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header
          Container(
            height: 110,
            width: width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      onNavigateBack();
                    },
                  ),
                  Expanded(
                    child: Text(
                      'Privacy Setting',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 21,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Notification Settings
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              children: [
                CustomSwitchTile(
                  title: 'All',
                  value: allNotifications,
                  onChanged: (bool value) {
                    setState(() {
                      allNotifications = value;
                      emailNotifications = value;
                      smsNotifications = value;
                      updatesNotifications = value;
                    });
                  },
                ),
                SizedBox(height: 12),
                NotificationTile(
                  svgAsset: "assets/svgs/Profile.svg",
                  title: 'Show Profile to Everyone',
                  value: emailNotifications,
                  onChanged: (bool value) {
                    setState(() {
                      emailNotifications = value;
                    });
                  },
                ),
                NotificationTile(
                  svgAsset: "assets/svgs/Notification.svg",
                  title: 'Lorem Ipsum',
                  value: smsNotifications,
                  onChanged: (bool value) {
                    setState(() {
                      smsNotifications = value;
                    });
                  },
                ),
                NotificationTile(
                  svgAsset: "assets/svgs/Notification.svg",
                  title: 'Lorem Ipsum',
                  value: updatesNotifications,
                  onChanged: (bool value) {
                    setState(() {
                      updatesNotifications = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
