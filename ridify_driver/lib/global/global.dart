import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ridify_driver/models/driverData.dart';
import 'package:ridify_driver/models/userModels.dart';

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

User? currentUser;

Position? driverCurrentPosition;

UserModel? userModelCurrentInfo;

DriverData onlineDriverdata =DriverData();

String? driverVehicleType="";

StreamSubscription<Position>? streamSubscriptionPosition;

StreamSubscription<Position>?streamSubscriptionDriverLivePosition;

// AssetsAudioPlayer audioPlayer= AssetsAudioPlayer();

String  titleStarsRating="";
