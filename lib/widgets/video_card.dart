import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/video_page.dart';

class VideoCard extends StatelessWidget {
  VideoCard({required this.data, required this.videoUrl});

  final videoUrl, data;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => VideoPage(
                        path: videoUrl,
                      )));
        },
        child: Container(
          margin: EdgeInsets.all(15),
          height: 200,
          width: MediaQuery.of(context).size.width * 0.45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.cyan,
            image: DecorationImage(
              image: FileImage(data),
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}
