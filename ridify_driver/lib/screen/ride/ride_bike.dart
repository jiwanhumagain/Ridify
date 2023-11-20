// import 'package:flutter/material.dart';
// import 'package:ridify_driver/maps/mapbox.dart';

// class RideBikeScreen extends StatefulWidget {
//   const RideBikeScreen({super.key});

//   @override
//   State<RideBikeScreen> createState() => _RideBikeScreenState();
// }

// class _RideBikeScreenState extends State<RideBikeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Center(
//         child: Padding(
//           padding: EdgeInsets.only(top: 30),
//           child: Column(
//             children: [
//               Image.asset(
//                 "assets/images/ride.png",
//                 height: 300,
//                 width: 300,
//               ),
//               const Text(
//                 "Let's take a Ride",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20,
//                   fontFamily: 'times',
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               const Text(
//                 "Eco-friendly, wallet-friendly, and always ready to ride.",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Colors.black38,
//                   fontSize: 15,
//                   fontFamily: 'times',
//                 ),
//               ),
//                Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 35, vertical: 25),
//                 child: SizedBox(
//                   height: 50,
//                   width: double.infinity,
//                   child: ElevatedButton.icon(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const MapBoxWidget(),
//                         ),
//                       );
//                     },
//                     style: ButtonStyle(
//                       foregroundColor:
//                           MaterialStateProperty.all<Color>(Colors.white),
//                       backgroundColor:
//                           MaterialStateProperty.all<Color>(Colors.purple),
//                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                         RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(25),
//                         ),
//                       ),
//                     ),
//                     label: const Text("Book a Ride"),
//                     icon: const Icon(Icons.arrow_right_alt),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
