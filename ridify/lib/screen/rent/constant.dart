import 'package:flutter/material.dart';
Color kPrimaryColor = Color.fromARGB(255, 164, 55, 237);
Color kPrimaryColorShadow = Color(0xFFF1EBFF);

const kButtonTextStyle = TextStyle(
  fontSize: 20.0,
);

const kCardMargin = 8.0;

const kFixedButtonPadding =
    EdgeInsets.only(left: 10.0, right: 10.0, bottom: 15.0);

const kTitleStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 25.0,
);

Color greyColor = Colors.black.withOpacity(0.6);

const kHeadingStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);

const kEnabledBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
  borderSide: const BorderSide(
    color: Colors.grey,
  ),
);

const kFocusedBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
  borderSide: BorderSide(color: Colors.blue),
);

const kErrorBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
  borderSide: BorderSide(color: Colors.red),
);

const kInputSpacing = 16.0;

const List<String> availableTimes = [
  '10:00',
  '10:30',
  '11:00',
  '11:30',
  '12:00',
  '12:30',
  '13:00',
  '13:30',
  '14:00',
  '14:30',
  '15:00',
  '15:30',
  '16:00',
  '16:30',
  '17:00',
  '17:30',
  '18:00',
  '18:30',
  '19:00',
  '19:30',
  '20:00',
  '20:30',
  '23:00',
  '23:30',
  '00:00',
  '07:00',
  '07:30',
  '08:00',
  '08:30',
  '09:00',
  '09:30',
];