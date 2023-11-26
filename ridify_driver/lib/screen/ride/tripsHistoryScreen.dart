import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ridify_driver/infoHandeler/app_info.dart';

import 'package:ridify_driver/tabPages/earningsTab.dart';
import 'package:ridify_driver/widgets/histroyDesignWidget.dart';

class TripHistoryScreen extends StatefulWidget {
  const TripHistoryScreen({super.key});

  @override
  State<TripHistoryScreen> createState() => _TripHistoryScreenState();
}

class _TripHistoryScreenState extends State<TripHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Trips History",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (c) => EarningsTabPage(),
              ),
            );
          },
          icon: Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView.separated(
          itemBuilder: (context, i) {
            return Card(
              color: Colors.grey[100],
              shadowColor: Colors.transparent,
              child: HistoryDesignUiWidget(
                tripHistoryModel: Provider.of<AppInfo>(context, listen: false)
                    .allTripsHistoryInformationList[i],
              ),
            );
          },
          separatorBuilder: (context, i) => SizedBox(
            height: 30,
          ),
          itemCount: Provider.of<AppInfo>(context, listen: false)
              .allTripsHistoryInformationList
              .length,
        ),
      ),
    );
  }
}
