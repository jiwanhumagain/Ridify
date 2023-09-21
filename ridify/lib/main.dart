import 'package:flutter/material.dart';
// import 'package:ridify/screen/auth/phone_reg.dart';
// import 'package:ridify/mapbox.dart';
// import 'package:ridify/ridify.dart';
import 'package:ridify/screen/auth/welcome.dart';
// import 'package:ridify/screen/auth/otp_screen.dart';
// import 'package:ridify/screen/auth/user_detail.dart';
// import 'package:ridify/screen/rent.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home:const WelcomeScreen(),
      // home: PhoneRegistration(),
      // home: OtpCode(),
      // home: UserDetail(),
      // home:const Rental(),
    ),
  );
}
