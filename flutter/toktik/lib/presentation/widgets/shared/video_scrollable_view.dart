import 'package:flutter/material.dart';
import 'package:toktik/domain/video_post.dart';
import 'package:toktik/presentation/widgets/video_button_group.dart';
import 'package:video_player/video_player.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost videoPost = videos[index];

        return Stack(
          children: [
            // Video Player + Gradient.
            SizedBox.expand(
              child: FullScreenPlayer(
                capiton: videoPost.caption,
                videoUrl: videoPost.videoUrl,
              ),
            ),
            // Buttons.
            const Positioned(bottom: 20, right: 10, child: VideoButtonGroup())
          ],
        );
      },
    );
  }
}

class FullScreenPlayer extends StatefulWidget {
  final String videoUrl;
  final String capiton;

  const FullScreenPlayer(
      {super.key, required this.videoUrl, required this.capiton});

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset(widget.videoUrl)
      ..setVolume(0)
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
              child:
                  CircularProgressIndicator(strokeWidth: 2, color: Colors.red));
        }

        final size = MediaQuery.of(context).size;

        return GestureDetector(
          onTap: () {
            if (controller.value.isPlaying) {
              controller.pause();
            } else {
              controller.play();
            }
          },
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: Stack(children: [
              VideoPlayer(controller),
              Positioned.fill(
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.transparent, Colors.black87],
                              stops: [0.7, 1.0],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)))),
              Positioned(
                bottom: 35,
                left: 20,
                child: SizedBox(
                  width: size.width * 0.6,
                  child: Text(widget.capiton, style: TextStyle(fontSize: 17)),
                ),
              )
            ]),
          ),
        );
      },
    );
  }
}
