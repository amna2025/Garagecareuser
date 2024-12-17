import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garagecare/presentation/Chat/message/components/MessageBubble.dart';
import 'package:garagecare/presentation/Chat/message/components/MessageHeader.dart';
import 'package:garagecare/presentation/Chat/message/components/MessageInput.dart';

class Message extends StatelessWidget {
  final String userName;
  final String userImageUrl;
  final bool isOnline;

  const Message({
    required this.userName,
    required this.userImageUrl,
    required this.isOnline,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          MessageHeader(userName: userName, userImageUrl: userImageUrl, isOnline: isOnline),
          SizedBox(height: 25),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(8.0),
              children: [
                MessageBubble(
                  message: 'Looking forward to the trip.',
                  userImageUrl: userImageUrl,
                  isOnline: isOnline,
                  isSent: false,
                  screenWidth: screenWidth,
                ),
                MessageBubble(
                  message: 'Same! Can\'t wait.',
                  userImageUrl: userImageUrl,
                  isOnline: isOnline,
                  isSent: true,
                  screenWidth: screenWidth,
                ),
                Center(
                  child: Text(
                    'Today 8:43 AM',
                    style: TextStyle(color: Colors.grey, fontSize: screenWidth * 0.03),
                  ),
                ),

            MessageBubble(
              message: 'Check out this image!',
              imagePath: 'assets/images/chat8.png',
              link:  'airbnb.com',
              userImageUrl: userImageUrl,
              isOnline: true,
              isSent: false, // Set true for sent messages, false for received messages
              screenWidth: MediaQuery.of(context).size.width,
            ),
                SizedBox(height: 8,),
                MessageBubble(
                  message: 'What do you think?',
                  userImageUrl: userImageUrl,
                  isOnline: isOnline,
                  isSent: false,
                  screenWidth: screenWidth,
                ),
                MessageBubble(
                  message: 'Same! Can\'t wait.',
                  userImageUrl: userImageUrl,
                  isOnline: isOnline,
                  isSent: true,
                  screenWidth: screenWidth,
                  isAudioMessage: true,
                ),

            ],
            ),
          ),
          MessageInput(screenWidth: screenWidth),
        ],
      ),
    );
  }
}
