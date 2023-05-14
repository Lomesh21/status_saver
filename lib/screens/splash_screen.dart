import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigateHome();
  }

  navigateHome () async{
    await Future.delayed(Duration(seconds: 3),(){});
    Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=> HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFffffff),
      body: Center(
        child: Image(
          image: AssetImage('images/logo.png'),
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}
