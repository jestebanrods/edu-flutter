import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

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

            if (textValue.isEmpty) {
              return;
            }

            onValue(textValue);
            textController.clear();
          },
        ));

    return TextFormField(
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      onFieldSubmitted: (value) {
        focusNode.requestFocus();

        if (value.isEmpty) {
          return;
        }

        onValue(value);
        textController.clear();
      },
    );
  }
}
