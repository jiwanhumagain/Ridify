import 'package:flutter/material.dart';
import 'package:ridify_driver/screen/rent/rent_taxi.dart';

class RentScreen extends StatefulWidget {
  const RentScreen({super.key});

  @override
  State<RentScreen> createState() => _RentScreenState();
}

class _RentScreenState extends State<RentScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            const Text(
              "Let's Rent",
              style: TextStyle(
                fontFamily: 'times',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "You have not rent a car. Rent it now ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15, fontFamily: 'times', color: Colors.black38),
            ),
            Image.asset(
              "assets/images/rental.png",
              height: 300,
              width: 300,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35, vertical: 25),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RentTaxiForm(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.purple),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                  label: const Text("Book a Ride"),
                  icon: const Icon(Icons.arrow_right_alt),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
