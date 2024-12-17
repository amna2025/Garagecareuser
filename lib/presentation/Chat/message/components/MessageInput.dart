import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MessageInput extends StatelessWidget {
  final double screenWidth;

  const MessageInput({required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(13.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey[200]!)),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/svgs/camera.svg',
            height: screenWidth * 0.05,
          ),
          SizedBox(width: 5.0),
          SvgPicture.asset(
            'assets/svgs/gallery.svg',
            height: screenWidth * 0.05,
          ),
          SizedBox(width: 5.0),
          Expanded(
            child: Container(
              height: screenWidth * 0.1,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Message',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                ),
              ),
            ),
          ),
          SizedBox(width: 5.0),
          SvgPicture.asset(
            'assets/svgs/Voice.svg',
            height: screenWidth * 0.05,
          ),
          SizedBox(width: 5.0),
          SvgPicture.asset(
            'assets/svgs/Send.svg',
            height: screenWidth * 0.05,
          ),
        ],
      ),
    );
  }
}
