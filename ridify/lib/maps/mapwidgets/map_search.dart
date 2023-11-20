import 'package:flutter/material.dart';
import 'package:ridify/assistant/request_assistant.dart';
import 'package:ridify/global/mapkey.dart';
import 'package:ridify/models/predictedPlaces.dart';
import 'package:ridify/widgets/place_prediction_tiles.dart';

class MapSearch extends StatefulWidget {
  const MapSearch({super.key});

  @override
  State<MapSearch> createState() => _MapSearchState();
}

class _MapSearchState extends State<MapSearch> {
  List<PredictedPlaces> placesPredictedList = [];
  void findPlaceAutoCompleteSearch(String inputText) async {
    if (inputText.length > 1) {
      String urlAutoCompleteSearch =
          "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$inputText&key=$mapKey&components=country:NP";

      var responseAutoCompleteSearch =
          await RequestAssistant.receiveRequest(urlAutoCompleteSearch);
      if (responseAutoCompleteSearch == "Error Occured") {
        return;
      }
      if (responseAutoCompleteSearch["status"] == "OK") {
        var placePredictions = responseAutoCompleteSearch["predictions"];

        var placePredictionsList = (placePredictions as List)
            .map((jsonData) => PredictedPlaces.fromJson(jsonData))
            .toList();

        setState(() {
          placesPredictedList=placePredictionsList;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.purple,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: Text(
            "Search Drop Location",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          elevation: 0.0,
        ),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.purple,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white54,
                    blurRadius: 8,
                    spreadRadius: 0.5,
                    offset: Offset(0.7, 0.7),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.adjust_sharp,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: TextField(
                              onChanged: (value) {
                                findPlaceAutoCompleteSearch(value);
                              },
                              decoration: InputDecoration(
                                hintText: "Search Location Here",
                                fillColor: Colors.white54,
                                filled: true,
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                  left: 11,
                                  top: 8,
                                  bottom: 8,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            //place prediction result list
            (placesPredictedList.length > 0)
                ? Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return PlacePredictionTiles(
                          predictedPlaces: placesPredictedList[index],
                        );
                      },
                      physics: ClampingScrollPhysics(),
                      separatorBuilder: (context, index) {
                        return Divider(
                          height: 0,
                          color: Colors.purple,
                          thickness: 0,
                        );
                      },
                      itemCount: placesPredictedList.length,
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
