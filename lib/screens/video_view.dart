import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:status_saver/constants.dart';
import '../provider/status_provider.dart';
import 'package:video_compress/video_compress.dart';
import '../widgets/video_card.dart';

class VideoView extends StatefulWidget {
  const VideoView({Key? key}) : super(key: key);

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<StatusProvider>(builder: (context, file, child) {
      List<FileSystemEntity> videoList = file.getVideo();
      return videoList.isEmpty
          ? Center(
              child: Text('No Media Available.'),
            )
          : GridView.builder(
              itemCount: videoList!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return FutureBuilder<File>(
                    future: getThumbNail(videoList[index].path),
                    builder: (context, snapshot) {
                      return snapshot.hasData
                          ? VideoCard(
                              data: snapshot.data,
                              videoUrl: videoList[index].path,
                            )
                          : Center(child: CircularProgressIndicator(color: AppConstants.primaryColor,));
                    });
              },
            );
    });
  }

  Future<File> getThumbNail(String path) async {
    File thumb = await VideoCompress.getFileThumbnail(
      path,
      quality: 50,
    );
    return thumb!;
  }
}
