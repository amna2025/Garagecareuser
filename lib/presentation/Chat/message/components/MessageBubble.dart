import 'package:flutter/material.dart';
import 'package:garagecare/core/constants/app_colors.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final String userImageUrl;
  final bool isOnline;
  final bool isSent;
  final double screenWidth;
  final String? link; // Optional link for received message with image
  final String? imagePath; // Optional image path for received message
  final bool isAudioMessage; // Indicates if the message is an audio message

  const MessageBubble({
    required this.message,
    required this.userImageUrl,
    required this.isOnline,
    required this.isSent,
    required this.screenWidth,
    this.link,
    this.imagePath,
    this.isAudioMessage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isSent ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (!isSent) _buildAvatar(),
        if (!isSent) SizedBox(width: 8.0),
        isSent ? _buildSentMessage() : _buildReceivedMessage(),
      ],
    );
  }

  Widget _buildAvatar() {
    return Stack(
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
    );
  }

  Widget _buildReceivedMessage() {
    if (link != null && imagePath != null) {
      return _buildReceivedMessageWithImageAndLink(message, link!, imagePath!, screenWidth);
    }
    return Container(
      padding: EdgeInsets.all(8.0),  // Reduced padding
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(24.0),
        ),
      ),
      child: Text(message, style: TextStyle(fontSize: 14.0)),  // Smaller font size
    );
  }

  Widget _buildSentMessage() {
    if (isAudioMessage) {
      return _buildSentAudioMessage(screenWidth);
    }
    return Container(
      padding: EdgeInsets.all(10.0),  // Reduced padding
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
          bottomLeft: Radius.circular(24.0),
          bottomRight: Radius.circular(0.0),
        ),
      ),
      child: Text(
        message,
        style: TextStyle(color: Colors.white, fontSize: 14.0),  // Smaller font size
      ),
    );
  }

  Widget _buildReceivedMessageWithImageAndLink(
      String message,
      String link,
      String imagePath,
      double screenWidth,
      ) {
    return  Container(

      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4.0),
          topRight: Radius.circular(4.0),
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(8.0),
        ),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              imagePath,
              width: screenWidth * 0.7, // Responsive image width
              height: screenWidth * 0.4, // Responsive image height
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0),
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(8.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(message, style: TextStyle(color: Colors.black)), // Message text
                  Text(
                    link,
                    style: TextStyle(color: Colors.grey[600], fontSize: screenWidth * 0.03), // Responsive link text size
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSentAudioMessage(double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.all(13.0),
          decoration: BoxDecoration(
            color: AppColors.text,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
              bottomLeft: Radius.circular(24.0),
              bottomRight: Radius.circular(0.0),
            ), // Set the border radius to 12.0 for a smoother look
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end, // Aligns the children to the right
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/voice.png', // Voice message icon
                    height: 33, // Set a height for the icon
                  ),
                ],
              ),
              SizedBox(height: 4.0), // Space between the audio message and timestamp
              Text(
                '09:13 - Read',
                style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.03), // Responsive font size
              ),
            ],
          ),
        ),
      ],
    );
  }
}
