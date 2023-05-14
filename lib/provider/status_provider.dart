import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:status_saver/constants.dart';

class StatusProvider extends ChangeNotifier{
  List imageList=[],videoList=[];
  void addStatus () async{
    final status = await [Permission.storage,Permission.manageExternalStorage].request();
    if(status[Permission.manageExternalStorage]!=PermissionStatus.granted){
      await Permission.storage.request();
      log("Permission Denied");
    }else {
      final directory = Directory(AppConstants.whatsAppPath);
      if(directory.existsSync()){
        final itemsList = directory
            .listSync()
            .toList(growable: false);
        imageList = itemsList.where((element) => element.path.endsWith(".jpg")).toList();
        videoList = itemsList.where((element) => element.path.endsWith(".mp4")).toList();
      }else{
        log("WhatsApp Not Found");
      }
    }
  }

  List getImages (){
    return imageList;
  }

  List getVideo(){
    return videoList;
  }
}