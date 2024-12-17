// import 'package:flutter/material.dart';
// import 'package:garagecaree/location.dart';
// import 'package:garagecaree/presentation/ChatScreen/chat.dart';
// import 'package:garagecaree/presentation/HomeScreen/homeScreen.dart';
// import 'package:garagecaree/profile.dart';
// import '../profile1.dart';
//
// class BottomBar extends StatefulWidget {
//   final int selectedIndex;
//   final Function(int) onItemSelected;
//
//   BottomBar({required this.selectedIndex , required this.onItemSelected});
//
//   @override
//   _BottomBarState createState() => _BottomBarState();
// }
//
// class _BottomBarState extends State<BottomBar> {
//   late int _currentIndex;
//
//   final List<Widget> _tabs = [
//     HomeScreen(),
//     ChatScreen(),
//     ShopScreen(),
//     ProfilePage(),
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     _currentIndex = widget.selectedIndex; // Set initial index
//   }
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//     widget.onItemSelected(index); // Notify parent of the selected index
//   }
//
//   Future<bool> _onWillPop() async {
//     if (_currentIndex != 0) {
//       setState(() {
//         _currentIndex = 0; // Navigate back to the HomeScreen
//       });
//       return false; // Don't allow exiting the app
//     }
//     return true; // Exit the app if on HomeScreen
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: _onWillPop,
//       child: Scaffold(
//         body: IndexedStack(
//           index: _currentIndex, // Preserve screen states
//           children: _tabs,
//         ),
//         bottomNavigationBar: Container(
//           height: 90,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.5),
//                 spreadRadius: 2,
//                 blurRadius: 7,
//                 offset: Offset(0, -3),
//               ),
//             ],
//           ),
//           child: BottomNavigationBar(
//             type: BottomNavigationBarType.fixed,
//             currentIndex: _currentIndex,
//             onTap: _onItemTapped,
//             selectedItemColor: Colors.blue,
//             unselectedItemColor: Colors.grey,
//             items: [
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.home),
//                 label: 'Home',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.chat),
//                 label: 'Chat',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.store),
//                 label: 'Shop',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.person),
//                 label: 'Profile',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // Example Shop Screen
// class ShopScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Shop Screen'), // Placeholder for shop screen
//     );
//   }
// }
// //import 'package:flutter/material.dart';
// // import 'package:garagecaree/location.dart';
// // import 'package:garagecaree/presentation/ChatScreen/chat.dart';
// // import 'package:garagecaree/presentation/HomeScreen/homeScreen.dart';
// // import 'package:garagecaree/profile.dart';
// //
// // class BottomBar extends StatelessWidget {
// //   final int selectedIndex;
// //   final Function(int) onItemSelected;
// //   final Function onNavigateToLocation;
// //
// //   BottomBar({
// //     required this.selectedIndex,
// //     required this.onItemSelected,
// //     required this.onNavigateToLocation,
// //   });
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return WillPopScope(
// //       onWillPop: () async {
// //         if (selectedIndex != 0) {
// //           onItemSelected(0); // Navigate back to HomeScreen
// //           return false; // Prevent default back navigation
// //         }
// //         return true; // Allow exiting if already on HomeScreen
// //       },
// //       child: Scaffold(
// //         body: IndexedStack(
// //           index: selectedIndex, // Preserve screen states
// //           children: [
// //             HomeScreen(onNavigateToLocation: onNavigateToLocation),
// //             ChatScreen(),
// //             ShopScreen(),
// //             ProfilePage(),
// //           ],
// //         ),
// //         bottomNavigationBar: CustomBottomNavigationBar(
// //           selectedIndex: selectedIndex,
// //           onItemTapped: onItemSelected,
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // class CustomBottomNavigationBar extends StatelessWidget {
// //   final int selectedIndex;
// //   final Function(int) onItemTapped;
// //
// //   CustomBottomNavigationBar({
// //     required this.selectedIndex,
// //     required this.onItemTapped,
// //   });
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       color: Colors.white,
// //       height: 60,
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceAround,
// //         children: [
// //           _buildNavItem(Icons.home, 'Home', 0),
// //           _buildNavItem(Icons.chat, 'Chat', 1),
// //           _buildNavItem(Icons.person, 'Profile', 2),
// //           // Location item removed from the bottom navigation bar
// //         ],
// //       ),
// //     );
// //   }
// //
// //   Widget _buildNavItem(IconData icon, String label, int index) {
// //     final isSelected = selectedIndex == index;
// //     return GestureDetector(
// //       onTap: () => onItemTapped(index),
// //       child: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           Icon(
// //             icon,
// //             color: isSelected ? Colors.blue : Colors.grey,
// //           ),
// //           Text(
// //             label,
// //             style: TextStyle(
// //               color: isSelected ? Colors.blue : Colors.grey,
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
// // // Example Shop Screen
// // class ShopScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Center(
// //       child: Text('Shop Screen'), // Placeholder for shop screen
// //     );
// //   }
// // }
// //
// // // Modify HomeScreen to include a button for LocationScreen
// // class HomeScreen extends StatelessWidget {
// //   final Function onNavigateToLocation;
// //
// //   HomeScreen({required this.onNavigateToLocation});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('Home')),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Text("Welcome to the Home Screen"),
// //             ElevatedButton(
// //               onPressed: () => onNavigateToLocation(), // Navigate to Location
// //               child: Text("Go to Location"),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // // Location Screen Implementation
// // class LocationScreen extends StatelessWidget {
// //   final VoidCallback onBackPressed;
// //
// //   LocationScreen({required this.onBackPressed});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Location Screen'),
// //         leading: IconButton(
// //           icon: Icon(Icons.arrow_back),
// //           onPressed: onBackPressed,
// //         ),
// //       ),
// //       body: Center(
// //         child: Text("This is the Location Screen"),
// //       ),
// //     );
// //   }
// // }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  CustomBottomNavigationBar({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home, 'Home', 0),
          _buildNavItem(Icons.chat, 'Chat', 1),
          _buildNavItem(Icons.store, 'Shop', 2),
          _buildNavItem(Icons.person, 'Profile', 3),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.blue : Colors.grey,
          ),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.blue : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}