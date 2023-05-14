import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:status_saver/constants.dart';
import 'package:status_saver/provider/status_provider.dart';
import 'package:status_saver/screens/image_view.dart';
import 'package:status_saver/screens/video_view.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor:AppConstants.primaryColor));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>StatusProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Status Saver',
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> screen = [ImageView(), VideoView()];
  int index = 0;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

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
      body: screen[index],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20),),
          color: AppConstants.primaryColor,
        ),
        child: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          unselectedItemColor: Colors.white,
         selectedItemColor: AppConstants.secondaryColor,
          currentIndex: index,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.image), label: "Image"),
            BottomNavigationBarItem(
                icon: Icon(Icons.video_collection_outlined), label: "Video"),
          ],
        ),
      ),
    ));
  }
}
