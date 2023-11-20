import 'package:flutter/widgets.dart';
import 'package:ridify_driver/models/directions.dart';

class AppInfo extends ChangeNotifier{
  Directions? userPickUpLocation,userDropOffLocation;
  int countTotalTrips = 0;
  // List<String> historyTripsKeysList = [];
  // List<TripHistoryModel> allTripsHistoryInformationList=[];

  void updatePickUpLocationAddress (Directions userPickUpAddress){
    userPickUpLocation=userPickUpAddress;
    notifyListeners();

  }

  void updateDropOffLocationAddress(Directions userDropOffAddress){
    userDropOffLocation=userDropOffAddress;
    notifyListeners();

  }

}