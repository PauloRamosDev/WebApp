import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoApp extends StatefulWidget {
  final link;

  const VideoApp({Key key, this.link}) : super(key: key);

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController _controller;
  ChewieController chewieController;

  @override
  void initState() {
    _controller = VideoPlayerController.network('http://' + widget.link);
    chewieController = chewie(_controller.value.aspectRatio);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {



    return MaterialApp(
      title: 'Video',
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: Chewie(controller: chewieController)),
      ),
    );
  }

  chewie(aspectRatio) {
    return ChewieController(
      videoPlayerController: _controller,
      aspectRatio: 16 / 9,
      autoPlay: true,
      allowedScreenSleep: false,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    chewieController.dispose();
  }
}
