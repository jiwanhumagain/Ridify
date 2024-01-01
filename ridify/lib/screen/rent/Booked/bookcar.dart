// //import 'dart:html';

// import 'package:flutter/material.dart';
// import 'package:ridify/screen/rent/Booked/bookingform.dart';
// import 'package:ridify/screen/rent/constant.dart';

// import '../data.dart';


// class BookCar extends StatefulWidget {

//   final Car car;

//   BookCar({required this.car});

//   @override
//   _BookCarState createState() => _BookCarState();
// }

// class _BookCarState extends State<BookCar> {

//   int _currentImage = 0;

//   List<Widget> buildPageIndicator(){
//     List<Widget> list = [];
//     for (var i = 0; i < widget.car.images.length; i++) {
//       list.add(buildIndicator(i == _currentImage));
//     }
//     return list;
//   }

//   Widget buildIndicator(bool isActive){
//     return AnimatedContainer(
//       duration: Duration(milliseconds: 150),
//       margin: EdgeInsets.symmetric(horizontal: 6),
//       height: 8,
//       width: isActive ? 20 : 8,
//       decoration: BoxDecoration(
//         color: isActive ? Colors.black : Colors.grey[400],
//         borderRadius: BorderRadius.all(
//           Radius.circular(12),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Container(
//           width: double.infinity,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [

//               Expanded(
//                 child: Container(
//                   padding: EdgeInsets.symmetric(vertical: 16),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [

//                       Container(
//                         padding: EdgeInsets.symmetric(horizontal: 16),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [

//                             GestureDetector(
//                               onTap: () {
//                                 Navigator.pop(context);
//                               },
//                               child: Container(
//                                 width: 45,
//                                 height: 45,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.all(
//                                     Radius.circular(15),
//                                   ),
//                                   border: Border.all(
//                                     color: Color.fromARGB(255, 101, 97, 97),
//                                     width: 1,
//                                   ),
//                                 ),
//                                 child: Icon(
//                                   Icons.keyboard_arrow_left,
//                                   color: Colors.black,
//                                   size: 28,
//                                 )
//                               ),
//                             ),

//                             Row(
//                               children: [

//                                 Container(
//                                   width: 45,
//                                   height: 45,
//                                   decoration: BoxDecoration(
//                                     color: kPrimaryColor,
//                                     borderRadius: BorderRadius.all(
//                                       Radius.circular(15),
//                                     ),
//                                   ),
//                                   child: Icon(
//                                     Icons.bookmark_border,
//                                     color: Colors.white,
//                                     size: 22,
//                                   )
//                                 ),

//                                 SizedBox(
//                                   width: 16,
//                                 ),

//                                 Container(
//                                   width: 45,
//                                   height: 45,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.all(
//                                       Radius.circular(15),
//                                     ),
//                                     border: Border.all(
//                                       color: const Color.fromARGB(255, 99, 96, 96),
//                                       width: 1,
//                                     ),
//                                   ),
//                                   child: Icon(
//                                     Icons.share,
//                                     color: Colors.black,
//                                     size: 22,
//                                   )
//                                 ),

//                               ],
//                             ),

//                           ],
//                         ),
//                       ),

//                       SizedBox(
//                         height: 16,
//                       ),

//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 16),
//                         child: Text(
//                           widget.car.model,
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 36,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),

//                       SizedBox(
//                         height: 8,
//                       ),

//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 16),
//                         child: Text(
//                           widget.car.brand,
//                           style: TextStyle(
//                             color: Colors.grey,
//                             fontSize: 14,
//                           ),
//                         ),
//                       ),

//                       SizedBox(
//                         height: 8,
//                       ),

//                       Expanded(
//                         child: Container(
//                           child: PageView(
//                             physics: BouncingScrollPhysics(),
//                             onPageChanged: (int page){
//                               setState(() {
//                                 _currentImage = page;
//                               });
//                             },
//                             children: widget.car.images.map((path) {
//                               return Container(
//                                 padding: EdgeInsets.symmetric(horizontal: 16,),
//                                 child: Hero(
//                                   tag: widget.car.model,
//                                   child: Image.asset(
//                                     path,
//                                     fit: BoxFit.scaleDown,
//                                   ),
//                                 ),
//                               );
//                             }).toList(),
//                           ),
//                         ),
//                       ),

//                       widget.car.images.length > 1
//                       ? Container(
//                         margin: EdgeInsets.symmetric(vertical: 16),
//                         height: 30,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: buildPageIndicator(),
//                         ),
//                       )
//                       : Container(),

//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 16),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [

//                             buildPricePerPeriod(
//                               "1",
//                               "4500",
//                               true,
//                             ),
//                             SizedBox(
//                               width: 16,
//                             ),
//                             buildPricePerPeriod(
//                               "7",
//                               "10000",
//                               false,
//                             ),
//                             SizedBox(
//                               width: 16,
//                             ),
//                             buildPricePerPeriod(
//                               "30",
//                               "25000",
//                               false,
//                             ),

//                           ],
//                         ),
//                       ),

//                     ],
//                   ),
//                 ),
//               ),
              
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.grey[100],
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(30),
//                     topRight: Radius.circular(30),
//                   ),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [

//                     Padding(
//                       padding: EdgeInsets.only(top: 16, left: 16, right: 16),
//                       child: Text(
//                         "SPECIFICATIONS",
//                         style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.grey[400],
//                         ),
//                       ),
//                     ),

//                     Container(
//                       height: 80,
//                       padding: EdgeInsets.only(top: 8, left: 16,),
//                       margin: EdgeInsets.only(bottom: 16),
//                       child: ListView(
//                         physics: BouncingScrollPhysics(),
//                         scrollDirection: Axis.horizontal,
//                         children: [
//                           buildSpecificationCar("Color", "White"),
//                           buildSpecificationCar("Gearbox", "Automatic"),
//                           buildSpecificationCar("Seat", "4"),
//                           buildSpecificationCar("Motor", "v10 2.0"),
//                           buildSpecificationCar("Speed (0-100)", "3.2 sec"),
//                           buildSpecificationCar("Top Speed", "121 mph"),
//                         ],
//                       ),
//                     ),

//                   ],
//                 ),
//               ),

//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: Container(
//         height: 90,
//         padding: EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: Colors.white,
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [

//                 Text(
//                   "12 Month",
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 14,
//                   ),
//                 ),

//                 SizedBox(
//                   height: 4,
//                 ),

//                 Row(
//                   children: [

//                     Text(
//                       "RS,350",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 22,
//                       ),
//                     ),

//                     SizedBox(
//                       width: 8,
//                     ),

//                     Text(
//                       "per month",
//                       style: TextStyle(
//                         color: Colors.grey,
//                         fontSize: 14,
//                       ),
//                     ),

//                   ],
//                 ),

//               ],
//             ),
//             Container(
              
              
//               child:Center(
                  
//                     child: ElevatedButton(child:Text(
//                         'Book This Car',
//                         style:TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                        ),
                      
//                        onPressed: (){
                        
//                          Navigator.push(context,
//                             MaterialPageRoute(builder: (context) {
//                           return RentTaxiForm();
//                        }));
//                        },
//                  style: ElevatedButton.styleFrom(
//                   backgroundColor:kPrimaryColor              
// ),
//                        ),
//                   ),

//             )
           
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildPricePerPeriod(String days, String price, bool selected){
//     return Expanded(
//       child: Container(
//         height: 110,
//         padding: EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: selected ? kPrimaryColor : Colors.white,
//           borderRadius: BorderRadius.all(
//             Radius.circular(15),
//           ),
//           border: Border.all(
//             color: const Color.fromARGB(255, 90, 88, 88),
//             width: selected ? 0 : 1,
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [

//             Text(
//               days + " Days",
//               style: TextStyle(
//                 color: selected ? Colors.white : Colors.black,
//                 fontSize: 14,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),

//             Expanded(
//               child: Container(),
//             ),

//             Text(
//               price,
//               style: TextStyle(
//                 color: selected ? Colors.white : Colors.black,
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),

//             Text(
//               "RS",
//               style: TextStyle(
//                 color: selected ? Colors.white : Colors.black,
//                 fontSize: 14,
//               ),
//             ),

//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildSpecificationCar(String title, String data){
//     return Container(
//       width: 130,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.all(
//           Radius.circular(15),
//         ),
//       ),
//       padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16,),
//       margin: EdgeInsets.only(right: 16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [

//           Text(
//             title,
//             style: TextStyle(
//               color: Colors.grey,
//               fontSize: 14,
//             ),
//           ),

//           SizedBox(
//             height: 8,
//           ),

//           Text(
//             data,
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),

//         ],
//       ),
//     );
//   }

// }