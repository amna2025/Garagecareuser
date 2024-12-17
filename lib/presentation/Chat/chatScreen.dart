import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garagecare/Riverpod/chat_riverpod.dart';
import 'package:garagecare/presentation/Chat/components/chat_item.dart';
import 'package:garagecare/presentation/Chat/message/messageScreen.dart';
import 'package:garagecare/presentation/entrypoint/entrypoint_screen.dart';
 // Import the new ChatItem component

class ChatScreen extends ConsumerWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredChatItems = ref.watch(chatProvider);
    final screenWidth = MediaQuery.of(context).size.width; // Get screen width

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Container for search bar and title
          Container(
            width: double.infinity,
            height: screenWidth > 600 ? 160 : 180, // Adjust height based on screen width
            padding: EdgeInsets.all(16),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenWidth > 600 ? 20 : 30), // Adjust padding for different screen sizes
                Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EntryPoint(selectedIndex: 0), // Assuming MainScreen handles BottomNavigationBar
                            ),
                          );
                        },
                        child: Icon(Icons.arrow_back, size: 24)),
                    SizedBox(width: 8),
                    Text(
                      'Chats',
                      style: TextStyle(
                        fontSize: screenWidth > 600 ? 20 : 23, // Adjust font size
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenWidth > 600 ? 5 : 10),
                // Search Bar
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 6),
                  child: TextField(
                    onChanged: (query) {
                      ref.read(chatProvider.notifier).filterChatItems(query);
                    },
                    decoration: InputDecoration(
                      hintText: 'Search chats',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Image.asset("assets/images/Search.png"),
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          // Expanded ListView for Filtered Chat Items
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 20),
              itemCount: filteredChatItems.length,
              itemBuilder: (context, index) {
                final chatItem = filteredChatItems[index];
                return Column(
                  children: [
                    ChatItem(
                      name: chatItem.name,
                      message: chatItem.message,
                      time: chatItem.time,
                      unreadCount: chatItem.unreadCount,
                      imageUrl: chatItem.imageUrl,
                      isOnline: chatItem.isOnline,
                      onTap: () {
                       // Navigate to Message screen with name and additional info
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Message(
                              userName: chatItem.name,
                              userImageUrl: chatItem.imageUrl,
                              isOnline: chatItem.isOnline,
                            ),
                          ),
                        );
                      },
                    ),
                    Divider(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: () {
            print('Add new chat action');
          },
          child: SvgPicture.asset(
            'assets/svgs/edit.svg',
          ),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
