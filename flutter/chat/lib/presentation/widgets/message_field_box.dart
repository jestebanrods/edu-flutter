import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    // final colors = Theme.of(context).colorScheme;

    var inputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(20));

    var inputDecoration = InputDecoration(
        hintText: 'End your message with a ?',
        enabledBorder: inputBorder,
        focusedBorder: inputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: () {
            final String textValue = textController.value.text;
            print('onPressed: $textValue');
            textController.clear();
          },
        ));

    return TextFormField(
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onTapOutside: (event) {
        print('onTapOutside');
        focusNode.unfocus();
      },
      onFieldSubmitted: (value) {
        print("onFieldSubmitted: $value");
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}
