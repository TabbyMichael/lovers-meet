import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, dynamic>> _messages = [
    {
      'text': 'Hello! How are you?',
      'isSentByMe': false,
      'time': '10:30 AM',
      'profilePic': 'https://via.placeholder.com/50', // Sender's profile pic
    },
    {
      'text': 'I am good! How about you?',
      'isSentByMe': true,
      'time': '10:32 AM',
    },
  ];

  final TextEditingController _messageController = TextEditingController();

  void _sendMessage() {
    final messageText = _messageController.text;
    if (messageText.isNotEmpty) {
      setState(() {
        _messages.add({
          'text': messageText,
          'isSentByMe': true,
          'time': '10:35 AM', // Ideally, use the current time
        });
      });
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://via.placeholder.com/150'), // Receiver's profile pic
            ),
            const SizedBox(width: 10),
            const Text('User Name'),
          ],
        ),
        backgroundColor: Colors.pink,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Options menu: Block, Delete chat, etc.
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isSentByMe = message['isSentByMe'] as bool;
                return Align(
                  alignment:
                      isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 14),
                    decoration: BoxDecoration(
                      color: isSentByMe ? Colors.pink[100] : Colors.grey[300],
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          message['text'] as String,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          message['time'] as String,
                          style: const TextStyle(
                              fontSize: 12.0, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            color: Colors.white,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.photo),
                  onPressed: () {
                    // Implement functionality to send images
                  },
                ),
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: 'Type a message...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
