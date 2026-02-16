import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPreview extends StatefulWidget {
  final String path;
  const VideoPreview({super.key, required this.path});

  @override
  State<StatefulWidget> createState() {
    return _VideoPreviewState();
  }
}

class _VideoPreviewState extends State<VideoPreview> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    // Safety: if path is empty, don't initialize controller.
    if (widget.path.isEmpty) return;

    try {
      _controller = VideoPlayerController.file(File(widget.path));
      _controller!.initialize().then((_) {
        if (!mounted) return;
        setState(() {
          _controller!..play();
          _controller!..setLooping(true);
        });
      }).catchError((e) {
        // ignore initialization errors, show fallback UI
        if (mounted) setState(() {});
      });
    } catch (e) {
      // Swallow any synchronous errors to avoid crashing the app
      _controller = null;
    }
  }

  @override
  void dispose() {
    _controller?.pause();
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null) {
      return const Center(child: Text('Tidak dapat memutar video'));
    }

    return _controller!.value.isInitialized
        ? AspectRatio(
            aspectRatio: _controller!.value.aspectRatio,
            child: VideoPlayer(_controller!),
          )
        : const Center(child: CircularProgressIndicator());
  }
}