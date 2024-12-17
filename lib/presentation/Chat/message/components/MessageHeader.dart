import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageHeader extends StatelessWidget {
  final String userName;
  final String userImageUrl;
  final bool isOnline;

  const MessageHeader({
    required this.userName,
    required this.userImageUrl,
    required this.isOnline,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: 110,
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
        padding: const EdgeInsets.only(top: 50),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Stack(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(userImageUrl),
                    radius: screenWidth * 0.05,
                  ),
                  if (isOnline)
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: screenWidth * 0.025,
                        height: screenWidth * 0.025,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(width: 8.0),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  userName,
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: screenWidth * 0.05),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 19.0, bottom: 8.0),
              child: Image.asset("assets/images/Search.png"),
            ),
          ],
        ),
      ),
    );
  }
}
