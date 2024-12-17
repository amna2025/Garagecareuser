import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatItemData {
  final String name;
  final String message;
  final String time;
  final int? unreadCount;
  final String imageUrl;
  final bool isOnline;

  ChatItemData({
    required this.name,
    required this.message,
    required this.time,
    this.unreadCount,
    required this.imageUrl,
    this.isOnline = false,
  });
}

class ChatStateNotifier extends StateNotifier<List<ChatItemData>> {
  ChatStateNotifier() : super(_initialChatItems);

  static  List<ChatItemData> _initialChatItems = [
    ChatItemData(name: 'DummyName 1', message: 'Good Morning, Did You Sleep Well?', time: '02:30 PM', unreadCount: 12, imageUrl: 'assets/images/chat1.png', isOnline: true),
    ChatItemData(name: 'DummyName 2', message: 'How Is It Going?', time: '02:36 PM', imageUrl: 'assets/images/chat2.png', isOnline: false),
    ChatItemData(name: 'DummyName 3', message: 'Okay, Done', time: '02:36 PM', unreadCount: 12, imageUrl: 'assets/images/chat3.png', isOnline: true),
    ChatItemData(name: 'DummyName 4', message: 'Alright, Noted', time: '02:36 PM', imageUrl: 'assets/images/chat4.png', isOnline: false),
    ChatItemData(name: 'DummyName 5', message: 'Hey, Did You Send That?', time: '02:36 PM', unreadCount: 6, imageUrl: 'assets/images/chat5.png', isOnline: true),
    ChatItemData(name: 'DummyName 6', message: 'How Is It Going?', time: '02:36 PM', imageUrl: 'assets/images/chat6.png', isOnline: true),
  ];

  void filterChatItems(String query) {
    if (query.isEmpty) {
      state = _initialChatItems;
    } else {
      state = _initialChatItems.where((item) {
        return item.name.toLowerCase().contains(query.toLowerCase()) ||
            item.message.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
  }
}

final chatProvider = StateNotifierProvider<ChatStateNotifier, List<ChatItemData>>((ref) {
  return ChatStateNotifier();
});
