import 'dart:convert';
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:ridify/assistant/request_assistant.dart';
import 'package:ridify/global/global.dart';
import 'package:ridify/global/mapkey.dart';
import 'package:ridify/infoHandeler/app_info.dart';
import 'package:ridify/models/directions.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:ridify/models/directionsDetails.dart';
import 'package:ridify/models/tripsHistoryModels.dart';
import 'package:ridify/models/userModels.dart';
import 'package:http/http.dart' as http;

class AssistantMethods {
  static void readCurrentOnlineUserInfo() {
    currentUser = firebaseAuth.currentUser;
    DatabaseReference userRef =
        FirebaseDatabase.instance.ref().child("users").child(currentUser!.uid);

    userRef.once().then((snap) {
      if (snap.snapshot.value != null) {
        userModelCurrentInfo = UserModel.fromSnapshot(snap.snapshot);
      }
    });
  }

  static Future<String> searchAddressForGeographicCoOrdinates(
      Position position, context) async {
    String apiUrl =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$mapKey";

    String humanReadableAddress = "";
    var requestResponse = await RequestAssistant.receiveRequest(apiUrl);

    if (requestResponse != "Error Occured") {
      humanReadableAddress = requestResponse["results"][0]["formatted_address"];

      Directions userPickUpAddress = Directions();
      userPickUpAddress.locationLatitude = position.latitude;
      userPickUpAddress.locationLongitude = position.longitude;
      userPickUpAddress.locationName = humanReadableAddress;

      Provider.of<AppInfo>(context, listen: false)
          .updatePickUpLocationAddress(userPickUpAddress);
    }
    return humanReadableAddress;
  }

  static Future<DirectionsDetails> obtainOriginToDestinationDirectionDetails(
      LatLng originPosition, LatLng destinationPosition) async {
    String urlOriginToDestinationDirectionDetails =
        "https://maps.googleapis.com/maps/api/directions/json?origin=${originPosition.latitude},${originPosition.longitude}&destination=${destinationPosition.latitude},${destinationPosition.longitude}&key=$mapKey";

    var responseDirectionApi = await RequestAssistant.receiveRequest(
      urlOriginToDestinationDirectionDetails,
    );

    // if (responseDirectionApi == "Error Occured") {
    //   return null;
    // }
    DirectionsDetails directionsDetailsInfo = DirectionsDetails();
    directionsDetailsInfo.e_points =
        responseDirectionApi["routes"][0]["overview_polyline"]["points"];

    directionsDetailsInfo.distance_text =
        responseDirectionApi["routes"][0]["legs"][0]["distance"]["text"];
    directionsDetailsInfo.distance_value =
        responseDirectionApi["routes"][0]["legs"][0]["distance"]["value"];

    directionsDetailsInfo.duration_text =
        responseDirectionApi["routes"][0]["legs"][0]["duration"]["text"];
    directionsDetailsInfo.distance_value =
        responseDirectionApi["routes"][0]["legs"][0]["duration"]["value"];

    return directionsDetailsInfo;
  }

  static double calculateFareAmountFromOriginToDestination(
      DirectionsDetails directionsDetailsInfo) {
    double timeTraveledFareAmountPerMinute =
        (directionsDetailsInfo.distance_value! / 60) * 0.1;
    double distanceTraveledFareAmountPerKilometer =
        (directionsDetailsInfo.distance_value! / 1000) * 0.1;

    //USD
    double totalFareAmount = timeTraveledFareAmountPerMinute +
        distanceTraveledFareAmountPerKilometer;
    return double.parse(totalFareAmount.toStringAsFixed(1));
  }

  static Future<void> sendNotificationToDriverNow(
    String deviceRegistrationToken,
    String userRideRequestId,
    context,
  ) async {
    String destinationAddress = userDropoffAddress;

    // Map<String, String> headerNotification = {
    //   'Content-Type': 'application/json',
    //   'Authorization': cloudMessagingServerToken,
    // };
    // Map bodyNotification = {
    //   'body': 'Destination Address:\n$destinationAddress',
    //   'title': 'New Trip Request',
    // };
    Map dataMap = {
      'click_action': "FLUTTER_NOTIFICATION_CLICK",
      'id': '1',
      'status': 'done',
      'rideRequestId': userRideRequestId,
    };
    // Map officialNotificationFormat = {
    //   'notification': bodyNotification,
    //   // 'data': dataMap,
    //   'priority': 'high',
    //   // 'to': deviceRegistrationToken,
    // };

    // var responseNotification = http.post(
    //   Uri.parse("https://fcm.googleapis.com/fcm/send"),
    //   headers: headerNotification,
    //   body: jsonEncode(officialNotificationFormat),
    // );
    // print("This is the response:${responseNotification}");

    try {
      final body = {
        "to": deviceRegistrationToken,
        // "notification": {"title": "Hello", "body": "It worked"}
        "notification": {
          'body': 'Destination Address:\n$destinationAddress',
          'title': 'New Trip Request',
        },
        "data":dataMap,
        
      };

      var response = await http.post(
        Uri.parse("https://fcm.googleapis.com/fcm/send"),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader:
              'key=AAAA0z1x6Bc:APA91bFTGAenxRTbpdR1cADTQbDY67R0hZcjNSpqEj9YQ8qLO4XlJqzDKB0YBJZxnGAa243CJpXzsgnsc4XgbMlMNxr7t8sLFXVPxyC0Y1EgEkGZW4Ih_jX56ux3FQy_iWjoUcvo2VUc'
        },
        body: jsonEncode(body),
      );
      Fluttertoast.showToast(msg: "Notification Sent successfully");
      print("This is destination address:${destinationAddress}");
    } catch (e) {
      Fluttertoast.showToast(msg: "Error occured");
    }
  }

  static void readTripsKeysForOnlineUser(context) {
    FirebaseDatabase.instance
        .ref()
        .child("All Ride Requests")
        .orderByChild("userName")
        .equalTo(userModelCurrentInfo!.name)
        .once()
        .then((snap) {
      if (snap.snapshot.value != null) {
        Map keysTripsId = snap.snapshot.value as Map;

        //count total number of trips and share it with provider

        int overAllTripsCounter = keysTripsId.length;
        Provider.of<AppInfo>(context, listen: false)
            .updateOverAllTripsCounter(overAllTripsCounter);

        //share trips keys with provider

        List<String> tripsKeysList = [];

        keysTripsId.forEach((key, value) {
          tripsKeysList.add(key);
        });

        Provider.of<AppInfo>(context, listen: false)
            .updateOverAllTripsKeys(tripsKeysList);

        //get trips keys data - read trips complete information

        readTripsHistoryInformation(context);
      }
    });
  }

  static void readTripsHistoryInformation(context) {
    var tripsAllKeys =
        Provider.of<AppInfo>(context, listen: false).historyTripsKeysList;

    for (String eachKey in tripsAllKeys) {
      FirebaseDatabase.instance
          .ref()
          .child("All Ride Requests")
          .child(eachKey)
          .once()
          .then((snap) {
        var eachTripHistory = TripHistoryModel.fromSnapshot(snap.snapshot);

        if ((snap.snapshot.value as Map)["status"] == "ended") {
          //update or add each history to overaltrips history list

          Provider.of<AppInfo>(context, listen: false)
              .updateOverAllTripsHistoryInformation(eachTripHistory);
        }
      });
    }
  }
}
