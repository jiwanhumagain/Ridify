import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ridify_driver/Notification/notificationDialogBox.dart';
import 'package:ridify_driver/infoHandeler/app_info.dart';
import 'package:ridify_driver/screen/auth/login.dart';
  
import 'package:ridify_driver/screen/auth/welcome.dart';
import 'package:ridify_driver/screen/ride/car_info.dart';
import 'package:ridify_driver/screen/ride/newTripScreen.dart';
import 'package:ridify_driver/screen/splashscreen/splash.dart';
import 'package:ridify_driver/maps/mapbox.dart';
import 'package:ridify_driver/tabPages/earningsTab.dart';
import 'package:ridify_driver/tabPages/ratingsTab.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDMeS3BVMdUlGkUA0eOKnyuP_bfE_2z2-A",
        appId: "1:907268974615:android:e8b9ee1e2aa1441051d452",
        messagingSenderId: "907268974615 ",
        projectId: "ridify-7547d"),
  );

  runApp(ChangeNotifierProvider(
    create: (context) => AppInfo(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      // home: const WelcomeScreen(),
      home: SplashScreen(),
      // home: NewTripScreen(),
      // home: NotificationDialogBox(),

      // home: RatingsTabPage(),

      // home: MapBoxWidget(),
      // home: CarInfoScreen(),
    ),
  ));
}
