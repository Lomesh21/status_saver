import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_gallery_saver/image_gallery_saver.dart';

import '../constants.dart';
class ImagePage extends StatefulWidget {
  ImagePage({required this.path});
  String path;
  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
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
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
              image: FileImage(File(widget.path)),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: ElevatedButton(
          onPressed: () async{
            ImageGallerySaver.saveFile(widget.path!).then((value){
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Image Saved'),));
            });
          },
          style: ElevatedButton.styleFrom(
            primary: AppConstants.primaryColor,
            onPrimary: Colors.white,
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
