import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({super.key});

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
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Emma',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const _ImageChat(),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}

class _ImageChat extends StatelessWidget {
  const _ImageChat();

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        "https://yesno.wtf/assets/yes/13-c3082a998e7758be8e582276f35d1336.gif",
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
