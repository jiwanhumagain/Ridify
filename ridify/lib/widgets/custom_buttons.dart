import 'package:flutter/material.dart';
class CustomButtons extends StatelessWidget {
  final String buttonText;
  const CustomButtons({super.key, required this.buttonText});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        // if (buttonText == 'Get Started') {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => const Ridify(),
        //     ),
        //   );
        //   if (buttonText == 'Login') {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => const Ridify(),
        //     ),
        //   );
        // }
        // if (buttonText == 'Get Started') {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => const Ridify(),
        //     ),
        //   );
        // }
        // if (buttonText == 'Get Started') {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => const Ridify(),
        //     ),
        //   );
        // }
        // }
      },
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
      label: Text(buttonText),
      icon: const Icon(Icons.arrow_right_alt),
    );
  }
}
