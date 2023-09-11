import 'package:flutter/material.dart';
import 'package:ridify/auth/phone_reg.dart';
// import 'package:ridify/mapbox.dart';
// import 'auth/welcome.dart';


void main(){
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home:WelcomeScreen(),
      home: PhoneRegistration(),
    ),
  );
}