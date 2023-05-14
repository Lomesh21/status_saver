import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:status_saver/provider/status_provider.dart';
import 'package:status_saver/screens/image_page.dart';
import 'package:status_saver/widgets/media_card.dart';

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
    List imagelist =
        Provider.of<StatusProvider>(context, listen: false).getImages();
    return Consumer<StatusProvider>(builder: (context, file, child) {
      return GridView.builder(
        itemCount: imagelist!.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return MediaCard(type: "Image", photoUrl: file.imageList[index]);
        },
      );
    });
  }
}
