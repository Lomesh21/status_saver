import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import '../screens/image_page.dart';

class ImageCard extends StatelessWidget {
  ImageCard({ required this.imageUrl});

  final imageUrl;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ImagePage(
                  path: imageUrl.path,
                )));
      },
      child: Container(
          margin: EdgeInsets.all(15),
          height: 200,
          width: MediaQuery.of(context).size.width * 0.45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xFFEDEFCE),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
              image: FileImage(File(imageUrl.path)),
              height: 220,
              width: 160,
              fit: BoxFit.cover,
            ),
          )),
    );
  }
}
