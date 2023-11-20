import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ridify_driver/assistant/assistant_methods.dart';
import 'package:ridify_driver/global/global.dart';
import 'package:ridify_driver/maps/mapbox.dart';
import 'package:ridify_driver/screen/auth/user_detail.dart';
import 'package:ridify_driver/screen/rent/rent.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimer(){
    Timer(Duration(seconds: 2), () async{ 
      if (await firebaseAuth.currentUser!=null) {
        firebaseAuth.currentUser!=null ? AssistantMethods.readCurrentOnlineUserInfo():null;
        Navigator.push(context, MaterialPageRoute(builder: ((context) => MapBoxWidget())));
        
      }
      else{
        Navigator.push(context, MaterialPageRoute(builder: ((context) => UserDetail())));

      }
    });
  }
  @override
  void initState(){
    super.initState();
    startTimer();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Ridify",
          style: TextStyle(
            fontFamily: 'times',
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
