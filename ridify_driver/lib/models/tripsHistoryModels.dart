
import 'package:firebase_database/firebase_database.dart';

class TripHistoryModel {
  String? time;
  String? originAddress;
  String? destinationAddress;
  String? status;
  String? fareAmount;
  String? car_details;
  String? driverName;
  String? ratings;

  TripHistoryModel({
    this.time,
    this.originAddress,
    this.destinationAddress,
    this.status,
    this.fareAmount,
    this.car_details,
    this.driverName,
    this.ratings,
  });

  TripHistoryModel.fromSnapshot(DataSnapshot dataSnapshot){
    time= (dataSnapshot.value as Map)["time"];
    destinationAddress= (dataSnapshot.value as Map)["destinationAddress"];
    originAddress= (dataSnapshot.value as Map)["originAddress"];
    status= (dataSnapshot.value as Map)["status"];
    fareAmount= (dataSnapshot.value as Map)["fareAmount"];
    car_details= (dataSnapshot.value as Map)["car_details"];
    driverName= (dataSnapshot.value as Map)["driverName"];
    ratings= (dataSnapshot.value as Map)["ratings"];

  }
}
