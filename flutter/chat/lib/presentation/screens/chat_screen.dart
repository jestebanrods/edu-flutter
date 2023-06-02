import 'package:chat/presentation/widgets/her_message_bubble.dart';
import 'package:chat/presentation/widgets/message_field_box.dart';
import 'package:flutter/material.dart';

import '../widgets/my_message_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: _ChatBar(),
      body: _ChatView(),
    );
  }
}

class _ChatBar extends StatelessWidget implements PreferredSizeWidget {
  const _ChatBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Padding(
        padding: EdgeInsets.all(4.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage(
              "https://cdn.shopify.com/s/files/1/0331/9182/1447/articles/10_fascinating_facts_about_black_cats-3_1200x1200.jpg?v=1667409596"),
        ),
      ),
      title: const Text('Emma'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _ChatView extends StatelessWidget {
  const _ChatView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListView.builder(
                  // If not define itemCount, the list is infinite.
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    if (index % 2 == 0) {
                      return const MyMessageBubble();
                    } else {
                      return const HerMessageBubble();
                    }
                  }),
            )),
            const MessageFieldBox()
          ],
        ),
      ),
    );
  }
}
