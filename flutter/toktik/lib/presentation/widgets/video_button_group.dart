import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:toktik/config/helpers/human_formats.dart';

class VideoButtonGroup extends StatelessWidget {
  const VideoButtonGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _CounterVideoButton(
            value: 2423, iconData: Icons.favorite, iconColor: Colors.red),
        const SizedBox(height: 20),
        const _CounterVideoButton(
            value: 90789787, iconData: Icons.remove_red_eye_outlined),
        const SizedBox(height: 20),
        SpinPerfect(
            infinite: true,
            duration: const Duration(seconds: 3),
            child: const _CounterVideoButton(
                value: 0, iconData: Icons.play_circle_rounded)),
      ],
    );
  }
}

class _CounterVideoButton extends StatelessWidget {
  final int value;
  final IconData iconData;
  final Color color;

  const _CounterVideoButton(
      {required this.value, required this.iconData, iconColor})
      : color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              iconData,
              color: color,
              size: 30.0,
            )),
        if (value > 0) Text(HumanFormats.humanReadbleNumber(value.toDouble()))
      ],
    );
  }
}
