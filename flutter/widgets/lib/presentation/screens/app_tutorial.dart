import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final slides = <SlideInfo>[
  SlideInfo('Slide 1', 'First step', 'assets/images/1.png'),
  SlideInfo('Slide 2', 'Second step', 'assets/images/2.png'),
  SlideInfo('Slide 3', 'Third step', 'assets/images/3.png'),
];

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

class AppTutorialScreen extends StatefulWidget {
  static String name = 'tutorial';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageController = PageController();
  bool endReach = false;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      final page = pageController.page ?? 0;
      if (!endReach && page >= (slides.length - 1.5)) {
        setState(() {
          endReach = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((slide) => _Slide(
                      title: slide.title,
                      caption: slide.caption,
                      imageUrl: slide.imageUrl,
                    ))
                .toList(),
          ),
          Positioned(
            right: 20,
            height: 100,
            child: TextButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('Skip'),
            ),
          ),
          endReach
              ? Positioned(
                  bottom: 20,
                  right: 20,
                  child: FadeInRight(
                    from: 15,
                    child: FilledButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: const Text('Inicar'),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imageUrl),
          const SizedBox(height: 10),
          Text(title, style: titleStyle),
          const SizedBox(height: 5),
          Text(caption, style: captionStyle),
        ],
      ),
    );
  }
}
