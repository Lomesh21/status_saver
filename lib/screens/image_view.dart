import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:status_saver/provider/status_provider.dart';
import 'package:status_saver/screens/image_page.dart';
import 'package:status_saver/widgets/image_card.dart';

class ImageView extends StatefulWidget {
  const ImageView({Key? key}) : super(key: key);

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<StatusProvider>(context, listen: false).addStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StatusProvider>(builder: (context, file, child) {
      List<FileSystemEntity> imageList = file.getImages();
      return imageList.isEmpty
          ? Center(
              child: Text('Images UnAvailable.'),
            )
          : GridView.builder(
              itemCount: imageList!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return ImageCard(imageUrl: imageList[index]);
              },
            );
    });
  }
}
