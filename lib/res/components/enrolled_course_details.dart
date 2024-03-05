import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class EnrolledCourseDetails extends StatefulWidget {
  const EnrolledCourseDetails({super.key});

  @override
  State<EnrolledCourseDetails> createState() => _EnrolledCourseDetailsState();
}

class _EnrolledCourseDetailsState extends State<EnrolledCourseDetails> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://drive.google.com/uc?export=download&id=1e7HJNDphTdvRQCJSTTYKeSwjrU6A2kmD'))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video'),
      ),
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : Container(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
