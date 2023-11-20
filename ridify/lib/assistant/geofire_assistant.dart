import 'package:ridify/models/activeNearbyDrivers.dart';

class GeoFireAssistant {
  static List<ActiveNearBYAvailableDrivers> activeNearBYAvailableDriversList=[];

  static void deleteOfflineDriverFromList(String driverId){
    int indexNumber = activeNearBYAvailableDriversList.indexWhere((element) => element.driverId==driverId);

    activeNearBYAvailableDriversList.removeAt(indexNumber);

  }

  static void updateActiveNearByAvailableDriverLocation(ActiveNearBYAvailableDrivers driverWhoMove){
    int indexNumber = activeNearBYAvailableDriversList.indexWhere((element) => element.driverId==driverWhoMove.driverId);

    activeNearBYAvailableDriversList[indexNumber].locationLatitiude=driverWhoMove.locationLatitiude;
    activeNearBYAvailableDriversList[indexNumber].locationLongitude=driverWhoMove.locationLongitude;
  }
}