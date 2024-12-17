import 'package:flutter/material.dart';
import 'package:garagecare/presentation/Home/Notification/components/custom_app_bar.dart';
import 'package:garagecare/presentation/Home/Notification/components/notifications_list.dart';


class NotificationsPage extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      'title': 'Account Signup Successfully',
      'description':
      'Your Account Has Been Successful. Your phone is linked with the application.',
      'date': '19 July 2024 | 10:00AM',
    },
    {
      'title': 'Password Updated',
      'description': 'Your password has been updated successfully.',
      'date': '18 July 2024 | 06:00AM',
    },
    {
      'title': 'Profile Updated',
      'description': 'Your profile information has been updated successfully.',
      'date': '17 July 2024 | 03:00PM',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: CustomAppBar(title: 'Notifications'),
      body: NotificationsList(notifications: notifications),
    );
  }
}
