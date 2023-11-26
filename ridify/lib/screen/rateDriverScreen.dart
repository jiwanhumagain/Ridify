import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ridify/global/global.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:ridify/screen/splashscreen/splash.dart';

class RateDriverScreen extends StatefulWidget {
  String? assignedDriverId;

  RateDriverScreen({this.assignedDriverId});

  @override
  State<RateDriverScreen> createState() => _RateDriverScreenState();
}

class _RateDriverScreenState extends State<RateDriverScreen> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      backgroundColor: Colors.transparent,
      child: Container(
        margin: EdgeInsets.all(8),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 22,
            ),
            Text(
              "Rate Trip Experience..",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                letterSpacing: 2,
                color: Colors.purple,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              thickness: 2,
              color: Colors.purple,
            ),
            SizedBox(
              height: 20,
            ),
            RatingStars(
              value: countRatingStars,
              starCount: 5,
              starColor: Colors.orange,
              starSize: 46,
              onValueChanged: (valueOfStarChoosed) {
                countRatingStars = valueOfStarChoosed;
                if (countRatingStars == 1) {
                  setState(() {
                    titleStarsRating = "very Bad";
                    countRatingStars = valueOfStarChoosed;
                  });
                }
                if (countRatingStars == 2) {
                  setState(() {
                    titleStarsRating = "Bad";
                    countRatingStars = valueOfStarChoosed;
                  });
                }
                if (countRatingStars == 3) {
                  setState(() {
                    titleStarsRating = "Good";
                    countRatingStars = valueOfStarChoosed;
                  });
                }
                if (countRatingStars == 4) {
                  setState(() {
                    titleStarsRating = "very Good";
                    countRatingStars = valueOfStarChoosed;
                  });
                }
                if (countRatingStars == 5) {
                  setState(() {
                    titleStarsRating = "Excellent";
                    countRatingStars = valueOfStarChoosed;
                  });
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              titleStarsRating,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.purple,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  DatabaseReference rateDriverRef = FirebaseDatabase.instance
                      .ref()
                      .child("drivers")
                      .child(widget.assignedDriverId!)
                      .child("ratings");

                  rateDriverRef.once().then((snap) {
                    if (snap.snapshot.value == null) {
                      rateDriverRef.set(countRatingStars.toString());
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (c) => SplashScreen(),
                        ),
                      );
                      

                    } else {
                      double pastRatings =
                          double.parse(snap.snapshot.value.toString());
                      double newAverageRatings =
                          (pastRatings + countRatingStars) / 2;
                      rateDriverRef.set(newAverageRatings.toString());
                       Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (c) => SplashScreen(),
                        ),
                      );
                      
                    }
                    Fluttertoast.showToast(msg: "Restarting the app");
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  padding: EdgeInsets.symmetric(
                    horizontal: 70,
                  ),
                ),
                child: Text(
                  "Submit",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
