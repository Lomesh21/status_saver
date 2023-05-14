import 'package:flutter/material.dart';
import 'package:status_saver/screens/image_page.dart';
import 'dart:io';
import '../screens/video_page.dart';

class MediaCard extends StatelessWidget {
  MediaCard({required this.type, required this.photoUrl});

  String type, photoUrl;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        type == "Image"
            ? Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ImagePage(
                          path: photoUrl,
                        )))
            : Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => VideoPage(
                          path: photoUrl,
                        )));
      },
      child: Container(
          margin: EdgeInsets.all(15),
          height: 200,
          width: MediaQuery.of(context).size.width * 0.45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.cyan,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
              image: FileImage(File(photoUrl)),
              height: 220,
              width: 160,
              fit: BoxFit.cover,
            ),
          )),
    );
  }
}
