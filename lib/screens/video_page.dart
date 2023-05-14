import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:video_player/video_player.dart';

import '../constants.dart';

class VideoPage extends StatefulWidget {
  VideoPage({required this.path});
  String path;
  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.path))
      ..initialize().then((_) {
        setState(() {});
      });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: BackButton(
          onPressed: (){
            _controller.pause();
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: AppConstants.primaryColor,
        title: Text(
          "Status Saver",
          style: TextStyle(
              fontSize: 22,
              color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.w600),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))
        ),
      ),
      body: WillPopScope(
        onWillPop: ()async{
          _controller.pause();
          Navigator.of(context).pop();
          return false;
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : Container(),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppConstants.secondaryColor,
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: ElevatedButton(
          onPressed: () {
            ImageGallerySaver.saveFile(widget.path!).then((value) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Video Saved'),
              ));
            });
          },
          style: ElevatedButton.styleFrom(
            primary: AppConstants.primaryColor,
            elevation: 3,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            minimumSize: Size(100, 40),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Text('Save',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600)),
          ),
        ),
      ),
    ));
  }
}
