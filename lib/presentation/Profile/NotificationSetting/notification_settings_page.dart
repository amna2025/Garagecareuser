import 'package:flutter/material.dart';
import 'package:garagecare/presentation/Profile/NotificationSetting/components/custom_switch_tile.dart';
import 'package:garagecare/presentation/Profile/NotificationSetting/components/notification_tile.dart';


class NotificationSettingsPage extends StatefulWidget {
  final VoidCallback onNavigateBack;
  const NotificationSettingsPage({super.key, required this.onNavigateBack});

  @override
  _NotificationSettingsPageState createState() => _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  void onNavigateBack() {
    widget.onNavigateBack(); // Call the provided navigation function
  }

  bool allNotifications = true;
  bool emailNotifications = true;
  bool smsNotifications = true;
  bool updatesNotifications = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async {
        onNavigateBack();
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              height: screenWidth * 0.32,
              width: double.infinity,
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
                padding: EdgeInsets.only(top: screenWidth * 0.15),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () {
                          onNavigateBack();
                        },
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          'Notification Setting',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: screenWidth * 0.05,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.05),
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
                    title: 'Email Notification',
                    value: emailNotifications,
                    onChanged: (bool value) {
                      setState(() {
                        emailNotifications = value;
                      });
                    },
                  ),
                  NotificationTile(
                    title: 'SMS Notification',
                    value: smsNotifications,
                    onChanged: (bool value) {
                      setState(() {
                        smsNotifications = value;
                      });
                    },
                  ),
                  NotificationTile(
                    title: 'New Updates Notification',
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
      ),
    );
  }
}
