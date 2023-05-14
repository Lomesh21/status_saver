import 'package:flutter/material.dart';

import '../widgets/media_card.dart';

class VideoView extends StatefulWidget {
  const VideoView({Key? key}) : super(key: key);

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      children: [
        MediaCard(
            type: "Image",
            photoUrl:
            "https://avatarfiles.alphacoders.com/206/thumb-206822.jpg"),
        MediaCard(
            type: "Image",
            photoUrl:
            "https://avatarfiles.alphacoders.com/206/thumb-206822.jpg"),
      ],
    );
  }
}
