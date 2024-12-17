// main_screen.dart
import 'package:flutter/material.dart';
import 'package:garagecare/customwidgets/CustomBottomNavBar.dart';
import 'package:garagecare/presentation/Chat/chatScreen.dart';
import 'package:garagecare/presentation/Home/homeScreen.dart';
import 'package:garagecare/presentation/Home/services/allservices/allservicesScreen.dart';
import 'package:garagecare/presentation/Profile/Location/all_locations_page.dart';
import 'package:garagecare/presentation/Profile/NotificationSetting/notification_settings_page.dart';
import 'package:garagecare/presentation/Profile/ProfilePage.dart';
import 'package:garagecare/presentation/Profile/ServicesHistory/ServiceHistoryPage.dart';
import 'package:garagecare/presentation/Profile/Setting/Password/Change%20Password%20Page.dart';
import 'package:garagecare/presentation/Profile/Setting/Privacy/privacy_setting_page.dart';
import 'package:garagecare/presentation/Profile/Setting/language/select_language_page.dart';
import 'package:garagecare/presentation/Profile/Setting/settings_page.dart';
import 'package:garagecare/presentation/entrypoint/components/shop_screen.dart';



class EntryPoint extends StatefulWidget {
  final int selectedIndex;

  const EntryPoint({super.key, this.selectedIndex = 0}); // Default to Home screen

  @override
  _EntryPointState createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  static const int homeIndex = 0;
  static const int chatIndex = 1;
  static const int shopIndex = 2;
  static const int profileIndex = 3;
  static const int locationServiceIndex = 4;
  static const int serviceSelectionIndex = 5; // Add index for Service Selection

  late int _selectedIndex;
  int _subIndex = 0; // To track which page to show within the combined index

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex; // Use the passed index
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      // Reset the subIndex when navigating to the combined index
      if (index == locationServiceIndex) {
        _subIndex = 0; // Default to show Locations
      }
    });
  }

  Future<bool> _onWillPop() async {
    if (_selectedIndex == homeIndex) {
      return true; // Exit the app
    } else if (_selectedIndex == profileIndex) {
      setState(() {
        _selectedIndex = homeIndex; // Go back to HomeScreen
      });
      return false; // Prevent exiting the app
    } else if (_selectedIndex == locationServiceIndex) {
      if (_subIndex == 4 || _subIndex == 5 || _subIndex == 6) {
        setState(() {
          _subIndex = 3; // Go back to Settings
        });
      } else {
        setState(() {
          _selectedIndex = profileIndex; // Go back to Profile
        });
      }
      return false; // Prevent exiting the app
    } else if (_selectedIndex == serviceSelectionIndex) {
      setState(() {
        _selectedIndex = homeIndex; // Go back to HomeScreen
      });
      return false; // Prevent exiting the app
    } else {
      setState(() {
        _selectedIndex = profileIndex; // Go back to ProfilePage
      });
      return false; // Prevent exiting the app
    }
  }

  Widget _getSelectedScreen() {
    switch (_selectedIndex) {
      case homeIndex:
        return HomeScreen(
          onNavigateToServiceSelection: () {
            setState(() {
              _selectedIndex = serviceSelectionIndex; // Navigate to Service Selection
            });
          }, username: 'amna',
        );
      case serviceSelectionIndex:
        return ServiceSelectionScreen(
          onNavigateBack: () {
            setState(() {
              _selectedIndex = homeIndex; // Go back to Home
            });
          },
        ); // Return your ServiceSelectionScreen
      case chatIndex:
         return ChatScreen();
      case shopIndex:
        return ShopScreen();
      case profileIndex:
        return ProfilePage(
          onNavigateToLocationAndServiceHistory: () {
            setState(() {
              _selectedIndex = locationServiceIndex;
              _subIndex = 0; // Navigate to Locations from Profile
            });
          },
          onNavigateToServiceHistory: () {
            setState(() {
              _selectedIndex = locationServiceIndex;
              _subIndex = 1; // Navigate to Service History from Profile
            });
          },
          onNavigateToNotificationSettings: () {
            setState(() {
              _selectedIndex = locationServiceIndex;
              _subIndex = 2; // Navigate to Notification Settings from Profile
            });
          },
          onNavigateToSettings: () {
            setState(() {
              _selectedIndex = locationServiceIndex;
              _subIndex = 3; // Navigate to Settings from Profile
            });
          },
        );
      case locationServiceIndex:
        switch (_subIndex) {
          case 0:
            return AllLocationsPage(
              onNavigateBack: () {
                setState(() {
                  _selectedIndex = profileIndex; // Go back to Profile
                });
              },
            );
          case 1:
            return ServiceHistoryPage(
              onNavigateBack: () {
                setState(() {
                  _selectedIndex = profileIndex; // Go back to Profile
                });
              },
            );
          case 2:
            return NotificationSettingsPage(
              onNavigateBack: () {
                setState(() {
                  _selectedIndex = profileIndex; // Go back to Profile
                });
              },
            );
          case 3:
            return SettingsPage(
              onNavigateToPrivacySettings: () {
                setState(() {
                  _subIndex = 4; // Navigate to Privacy Settings within Settings
                });
              },
              onNavigateToLanguageSettings: () {
                setState(() {
                  _subIndex = 5; // Navigate to Language Settings within Settings
                });
              },
              onNavigateToPasswordSettings: () {
                setState(() {
                  _subIndex = 6; // Navigate to Password Settings within Settings
                });
              },
              onNavigateBack: () {
                setState(() {
                  _selectedIndex = profileIndex; // Go back to Profile
                });
              },
            );
          case 4:
            return PrivacySettingPage(
              onNavigateBack: () {
                setState(() {
                  _subIndex = 3; // Go back to Settings
                });
              },
            );
          case 5:
            return SelectLanguagePage(
              onNavigateBack: () {
                setState(() {
                  _subIndex = 3; // Go back to Settings
                });
              },
            );
          case 6:
            return ChangePasswordPage(
              onNavigateBack: () {
                setState(() {
                  _subIndex = 3; // Go back to Settings
                });
              },
            );
          default:
            return ShopScreen(); // Fallback to Locations
        }
      default:
        return ShopScreen(); // Fallback to HomeScreen
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: _getSelectedScreen(),
        bottomNavigationBar: CustomBottomNavigationBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}