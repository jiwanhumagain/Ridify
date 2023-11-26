import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ridify_driver/global/global.dart';
import 'package:ridify_driver/infoHandeler/app_info.dart';
import 'package:ridify_driver/screen/ride/tripsHistoryScreen.dart';

class EarningsTabPage extends StatefulWidget {
  const EarningsTabPage({super.key});

  @override
  State<EarningsTabPage> createState() => _EarningsTabPageState();
}

class _EarningsTabPageState extends State<EarningsTabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              color: Colors.purpleAccent,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 80),
                child: Column(
                  children: [
                    Text(
                      "Your Earnings",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Rs " +
                          Provider.of<AppInfo>(context, listen: false)
                              .driverTotalEarnings,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (c) => TripHistoryScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(primary: Colors.white54),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      onlineDriverdata.car_type == "Car"
                          ? "assets/images/taxi.png"
                          : "assets/images/ride.png",
                      // scale: 2,
                      height: 20,
                      width: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Trips Completed",
                      style: TextStyle(color: Colors.black54),
                    ),
                    Expanded(
                        child: Container(
                      child: Text(
                        Provider.of<AppInfo>(context, listen: false)
                            .allTripsHistoryInformationList
                            .length
                            .toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
