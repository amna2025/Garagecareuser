import 'package:flutter/material.dart';
import 'notification_item.dart';

class NotificationsList extends StatelessWidget {
  final List<Map<String, String>> notifications;

  const NotificationsList({required this.notifications});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: notifications.map((notification) {
            return NotificationItem(notification: notification);
          }).toList(),
        ),
      ),
    );
  }
}
