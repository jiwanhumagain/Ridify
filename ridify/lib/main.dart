import 'package:flutter/material.dart';
import 'package:ridify/mapbox.dart';


void main(){
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:MapBoxWidget(),
    ),
  );
}