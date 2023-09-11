import 'package:flutter/material.dart';
import 'package:ridify/widgets/custom_buttons.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ridify"),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 35,
              vertical: 25,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 400,
                  width: 600,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Let's Get Started",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Times'),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Take a Ride",
                  style: TextStyle(
                      fontSize: 14, color: Colors.black38, fontFamily: 'Times'),
                ),
                const SizedBox(
                  height: 35,
                ),
                const SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: CustomButtons(buttonText: "Get Started"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
