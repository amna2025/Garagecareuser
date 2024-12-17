import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garagecare/presentation/Profile/components/ProfileEditDialog.dart';
import 'package:garagecare/presentation/Profile/components/ProfileOptionTile.dart';
 // Importing the profile edit dialog widget

class ProfilePage extends StatefulWidget {
  final Function onNavigateToLocationAndServiceHistory;
  final Function onNavigateToServiceHistory;
  final Function onNavigateToNotificationSettings;
  final Function onNavigateToSettings;

  const ProfilePage({
    super.key,
    required this.onNavigateToLocationAndServiceHistory,
    required this.onNavigateToServiceHistory,
    required this.onNavigateToNotificationSettings,
    required this.onNavigateToSettings,
  });

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isEditVisible = false;
  String selectedCountryCode = '+92';
  String selectedCountryName = 'Pakistan';

  void _navigateToAllLocations() {
    widget.onNavigateToLocationAndServiceHistory();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          // Background image
          Container(
            height: screenSize.height * 0.2,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Profile content
          Positioned(
            top: screenSize.height * 0.05,
            left: 8,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {

              },
            ),
          ),
          Positioned(
            top: screenSize.height * 0.06,
            left: 50,
            child: Text(
              'Profile',
              style: TextStyle(
                color: Colors.white,
                fontSize: screenSize.width * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenSize.height * 0.1),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenSize.width * 0.07,
                    vertical: screenSize.width * 0.08,
                  ),
                  child: CircleAvatar(
                    radius: 37,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 46,
                      backgroundImage: AssetImage("assets/images/image.png"),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenSize.width * 0.06,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('DummyName', style: TextStyle(fontSize: screenSize.width * 0.06, fontWeight: FontWeight.bold)),
                          Text('Lorem ipsum is a dummy address\nused for UI design.', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _isEditVisible = !_isEditVisible;
                              });
                            },
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, minimumSize: Size(screenSize.width * 0.25, 36), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Edit', style: TextStyle(color: Colors.white)),
                                SizedBox(width: 8),
                                SvgPicture.asset("assets/svgs/edit2.svg", color: Colors.white),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(endIndent: 22, indent: 22),
                SizedBox(height: 5),
                ProfileOptionTile(iconPath: "assets/svgs/Location.svg", title: "All Locations", onTap: _navigateToAllLocations),
                ProfileOptionTile(iconPath: "assets/svgs/service.svg", title: "Service History", onTap: widget.onNavigateToServiceHistory),
                ProfileOptionTile(iconPath: "assets/svgs/Notification.svg", title: "Notification Setting", onTap: widget.onNavigateToNotificationSettings),
                ProfileOptionTile(iconPath: "assets/svgs/Setting.svg", title: "Settings", onTap: widget.onNavigateToSettings),
                ProfileOptionTile(iconPath: "assets/svgs/Logout.svg", title: "Logout", onTap: () {}),
              ],
            ),
          ),
          // Edit profile dialog
          if (_isEditVisible) ProfileEditDialog(),
        ],
      ),
    );
  }
}
