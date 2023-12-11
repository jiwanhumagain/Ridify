import 'package:flutter/material.dart';
// import 'package:ridify/screen/rent/rent_screen.dart';
import 'package:ridify/screen/ride/ride_bike.dart';
import 'package:ridify/screen/ride/ride_taxi.dart';
// import 'package:ridify/screen/rent/rent_taxi.dart';
import 'package:ridify/screen/rent/screen/rent_screen.dart';
class Rental extends StatefulWidget {
  const Rental({super.key});

  @override
  State<Rental> createState() => _RentalState();
}

class _RentalState extends State<Rental> {
  int _selectedIndex = 0;
  List<Widget> widgetList = const [
    RideBikeScreen(),
    RideTaxi(),
    RentScreen(),
    // RentTaxiForm()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('AppBar Demo'),
      //   actions: <Widget>[
      //     IconButton(
      //       icon: const Icon(Icons.account_circle),
      //       tooltip: 'Show Snackbar',
      //       onPressed: () {
      //         ScaffoldMessenger.of(context).showSnackBar(
      //             const SnackBar(content: Text('This is a snackbar')));
      //       },
      //     ),
      //   ],
      // ),
      body:SafeArea(
        // child: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: RentTaxiForm(),
        // ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [

                BottomNavigationBar(
                  selectedLabelStyle: const TextStyle(
                    fontFamily: 'times',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontFamily: 'times',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  iconSize: 30,
                  currentIndex: _selectedIndex,
                  onTap: (value) {
                    setState(() {
                      _selectedIndex = value;
                    });
                  },
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.directions_bike,
                      ),
                      label: "Bike",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.directions_car,
                      ),
                      label: "Taxi",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.car_rental,
                      ),
                      label: "Rent",
                    ),
                  ],
                ),
                widgetList[_selectedIndex],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
