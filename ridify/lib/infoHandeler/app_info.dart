import 'package:flutter/widgets.dart';
import 'package:ridify/models/directions.dart';
import 'package:ridify/models/tripsHistoryModels.dart';

class AppInfo extends ChangeNotifier{
  Directions? userPickUpLocation,userDropOffLocation;
  int countTotalTrips = 0;
  List<String> historyTripsKeysList = [];
  List<TripHistoryModel> allTripsHistoryInformationList=[];

  void updatePickUpLocationAddress (Directions userPickUpAddress){
    userPickUpLocation=userPickUpAddress;
    notifyListeners();

  }

  void updateDropOffLocationAddress(Directions userDropOffAddress){
    userDropOffLocation=userDropOffAddress;
    notifyListeners();

  }
  updateOverAllTripsCounter(int overAllTripsCounter){
    countTotalTrips=overAllTripsCounter;
    notifyListeners();
  }
  updateOverAllTripsKeys(List<String>tripsKeysList){
    historyTripsKeysList=tripsKeysList;
    notifyListeners();
  }
  updateOverAllTripsHistoryInformation(TripHistoryModel eachTripHistory){
    allTripsHistoryInformationList.add(eachTripHistory);
    notifyListeners();
  }

}