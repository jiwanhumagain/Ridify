import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ridify_driver/Notification/notificationDialogBox.dart';
import 'package:ridify_driver/global/global.dart';
import 'package:ridify_driver/models/userRideRequestInformation.dart';
import 'package:ridify_driver/screen/splashscreen/splash.dart';

class PushNotificationSystem {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  Future <void>initializeCloudMessaging(BuildContext context) async {
    //when app is closed open directly from push notification

    // FirebaseMessaging.instance
    //     .getInitialMessage()
    //     .then((RemoteMessage? remoteMessage) {
    //   if (remoteMessage != null) {
    //     readUserRideRequestInformation(
    //         remoteMessage.data["rideRequestId"], context);
    //   }
    // });

    //when the app is open and receive notification

    // FirebaseMessaging.onMessage.listen((RemoteMessage? remoteMessage) {
    //   readUserRideRequestInformation(
    //       remoteMessage!.data["rideRequestId"], context);
    // });
    //when app is running in background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage? remoteMessage) {
      print("This is Remotemessage:${remoteMessage}");
      readUserRideRequestInformation(
          remoteMessage!.data["rideRequestId"], context);

    });
  }

  readUserRideRequestInformation(
      String userRideRequestId, BuildContext context) {
    FirebaseDatabase.instance
        .ref()
        .child("All Ride Requests")
        .child(userRideRequestId)
        .child("driverId")
        .once()
        .then((event) {
      if (event.snapshot.value == "waiting" ||
          event.snapshot.value == firebaseAuth.currentUser!.uid) {
        FirebaseDatabase.instance
            .ref()
            .child("All Ride Requests")
            .child(userRideRequestId)
            .once()
            .then((snapData) {
            String? localStatus = ((snapData.snapshot.value! as Map)["status"]);
          if (snapData.snapshot.value != null && localStatus == null) {
            print("Triggered:${snapData.snapshot.value}");
            double originLat = double.parse(
                (snapData.snapshot.value! as Map)["origin"]["latitude"]);
            double originLng = double.parse(
                (snapData.snapshot.value! as Map)["origin"]["longitude"]);
            String originAddress =
                (snapData.snapshot.value! as Map)["originAddress"];

            double destinationLat = double.parse(
                (snapData.snapshot.value! as Map)["destination"]["latitude"]);
            double destinationLng = double.parse(
                (snapData.snapshot.value! as Map)["destination"]["longitude"]);
            String destinationAddress =
                (snapData.snapshot.value! as Map)["destinationAddress"];

            String userName = (snapData.snapshot.value! as Map)["userName"];
            String userPhone = (snapData.snapshot.value! as Map)["userPhone"];

            String? rideRequestId = snapData.snapshot.key;

            UserRideRequestInformation userRideRequestDetails =
                UserRideRequestInformation();
            userRideRequestDetails.originLatLng = LatLng(originLat, originLng);
            userRideRequestDetails.originAddress = originAddress;
            userRideRequestDetails.destinationLatLng =
                LatLng(destinationLat, destinationLng);
            userRideRequestDetails.destinationAddress = destinationAddress;

            userRideRequestDetails.userName = userName;
            userRideRequestDetails.userPhone = userPhone;

            userRideRequestDetails.rideRequestId = rideRequestId;
            // Navigator.push(context, MaterialPageRoute(builder: (c)=>NotificationDialogBox()));
            
            showDialog(
              context: context,
              builder: (BuildContext context) => NotificationDialogBox(
                userRideRequestDetails: userRideRequestDetails,
              ),
            );


          }
          else if(localStatus == "accepted"){
            print("Ride is on progress!");
          }
           else {
            Fluttertoast.showToast(msg: "This Ride Request Id do not exist ");
            Navigator.push(context, MaterialPageRoute(builder: (c)=>SplashScreen()));
          }
        });
      } else {
        Fluttertoast.showToast(msg: "This Ride Request has been cancel ");
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (c) => SplashScreen(),
          ),
        );
      }
    });
  }

  Future generateAndGetToken() async {
    String? registrationToken = await messaging.getToken();

    FirebaseDatabase.instance
        .ref()
        .child("drivers")
        .child(firebaseAuth.currentUser!.uid)
        .child("token")
        .set(registrationToken);
    messaging.subscribeToTopic("allDrivers");
    messaging.subscribeToTopic("allUsers");
  }
  
}
