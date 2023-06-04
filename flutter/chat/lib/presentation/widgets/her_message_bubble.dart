import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  final String message;
  final String imageUrl;

  const HerMessageBubble(
      {super.key, required this.message, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.secondary,
              borderRadius: BorderRadius.circular(20.0)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        _ImageChat(imageUrl: imageUrl),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}

class _ImageChat extends StatelessWidget {
  final String imageUrl;
  const _ImageChat({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
        width: deviceSize.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Container(
            padding: const EdgeInsets.all(10),
            width: deviceSize.width * 0.7,
            height: 150,
            child: const Text('Cargando ...'),
          );
        },
      ),
    );
  }
}
