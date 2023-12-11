import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ridify/infoHandeler/app_info.dart';
import 'package:ridify/screen/auth/login.dart';

import 'package:ridify/screen/auth/welcome.dart';
import 'package:ridify/screen/rent/screen/rent_screen.dart';
import 'package:ridify/screen/splashscreen/splash.dart';
import 'package:ridify/maps/mapbox.dart';
import 'package:ridify/widgets/payFareAmount.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDMeS3BVMdUlGkUA0eOKnyuP_bfE_2z2-A",
        appId: "1:907268974615:android:b798353ae2201bf451d452",
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
      home: RentScreen(),

      // home: MapBoxWidget(),
     // home: PayFareAmountDialog(),
    ),
  ));
}
