import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ridify/assistant/request_assistant.dart';
import 'package:ridify/global/global.dart';
import 'package:ridify/global/mapkey.dart';
import 'package:ridify/infoHandeler/app_info.dart';
import 'package:ridify/models/directions.dart';
import 'package:ridify/models/predictedPlaces.dart';
import 'package:ridify/widgets/progressDialog.dart';

class PlacePredictionTiles extends StatefulWidget {
  final PredictedPlaces? predictedPlaces;
  PlacePredictionTiles({this.predictedPlaces});

  @override
  State<PlacePredictionTiles> createState() => _PlacePredictionTilesState();
}

class _PlacePredictionTilesState extends State<PlacePredictionTiles> {
  getPlaceDirectionDetails(String? placeID, context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) => ProgressDialog(
        message: "Setting up Drop-Off.Please Wait...",
      ),
    );
    String placeDirectionDetailsUrl ="https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeID&key=$mapKey";
    var responseApi = await RequestAssistant.receiveRequest(placeDirectionDetailsUrl);
    Navigator.pop(context);
    if (responseApi== "Error Occured") {
      return;
      
    }
    if (responseApi["status"]=="OK") {
      Directions directions =Directions();
      directions.locationName = responseApi["result"]["name"];
      directions.locationId=placeID;
      directions.locationLatitude=responseApi["result"]["geometry"]["location"]["lat"];
      directions.locationLongitude=responseApi["result"]["geometry"]["location"]["lng"];

      Provider.of<AppInfo>(context,listen: false).updateDropOffLocationAddress(directions);

      setState(() {
        
        userDropoffAddress=directions.locationName!;
      });

      Navigator.pop(context,"obtainedDropoff");

    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        getPlaceDirectionDetails(widget.predictedPlaces!.place_id!, context);
      },
      style: ElevatedButton.styleFrom(primary: Colors.white),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Icon(
              Icons.add_location,
              color: Colors.purple,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.predictedPlaces!.main_text!,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16, color: Colors.purple),
                ),
                Text(
                  widget.predictedPlaces!.secondary_text!,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16, color: Colors.purple),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
