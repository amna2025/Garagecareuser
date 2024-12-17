import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garagecare/presentation/Profile/Setting/Privacy/privacy_setting_page.dart';
import 'components/setting_item.dart';

class SettingsPage extends StatefulWidget {
  final VoidCallback onNavigateBack;
  final VoidCallback onNavigateToPrivacySettings;
  final VoidCallback onNavigateToLanguageSettings;
  final VoidCallback onNavigateToPasswordSettings;


  const SettingsPage({
    Key? key,
    required this.onNavigateBack,
    required this.onNavigateToPrivacySettings,
    required this.onNavigateToLanguageSettings,
    required this.onNavigateToPasswordSettings,

  }) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header
          Container(
            height: 110,
            width: screenWidth,
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
              padding: EdgeInsets.only(top: screenHeight * 0.06),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: widget.onNavigateBack,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Settings',
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

          // Settings List
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Column(
              children: [
                SettingItem(
                  svgAsset: "assets/svgs/Shield Done.svg",
                  text: 'Privacy Setting',
                  onTap:  widget.onNavigateToPrivacySettings
                ),
                SettingItem(
                  svgAsset: "assets/svgs/Shield Done.svg",
                  text: 'Language',
                  onTap:  widget.onNavigateToLanguageSettings
                ),
                SettingItem(
                  svgAsset: "assets/svgs/Password.svg",
                  text: 'Password Setting',
                  onTap:widget.onNavigateToPasswordSettings,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
