import 'package:flutter/material.dart';

class VideoPage extends StatefulWidget {
  VideoPage({required this.path});
  String path;
  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFFD4D576),
            title: Text(
              "Status Saver",
              style: TextStyle(
                  fontSize: 22,
                  color: Color(0xFFD76767),
                  fontWeight: FontWeight.w600),
            ),
          ),
          body: Container(
            margin: EdgeInsets.all(20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: NetworkImage(widget.path),
                height: MediaQuery.of(context).size.height * 0.75,
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover,
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFD4D576),
                onPrimary: Colors.white,
                shadowColor: Colors.greenAccent,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                minimumSize: Size(100, 40),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text('Download',
                    style: TextStyle(
                        fontSize: 22,
                        color: Color(0xFFD76767),
                        fontWeight: FontWeight.w600)),
              ),
            ),
          ),
        ));
  }
}