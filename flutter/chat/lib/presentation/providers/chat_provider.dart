import 'package:chat/config/helpers/yes_no_answer_repository.dart';
import 'package:chat/domain/message.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatSchrollController = ScrollController();
  final YesNoAnswerRepository repository = YesNoAnswerRepository();

  List<Message> messages = [
    Message(text: 'Hola Emilia!!!', fromWho: FromWho.me),
    Message(text: 'Miau', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messages.add(newMessage);
    notifyListeners();
    moveScrollToBottom();

    if (text.endsWith('?')) {
      herReplay();
    }
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatSchrollController.animateTo(
        chatSchrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }

  Future<void> herReplay() async {
    final herMessage = await repository.getAnswer();
    messages.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }
}
