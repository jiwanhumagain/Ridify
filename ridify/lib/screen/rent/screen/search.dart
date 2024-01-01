

import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:bouncing_widget/bouncing_widget.dart';


import '../Booked/cardetail.dart';
import '../constant.dart';
import 'topdeals.dart';

class RentCar extends StatefulWidget {
  const RentCar({super.key});

  @override
  State<RentCar> createState() => _RentCarState();
}

class _RentCarState extends State<RentCar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Ridify",
            style:TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ), systemOverlayStyle: SystemUiOverlayStyle.dark,
      centerTitle:false,
      actions: [
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(
                Icons.menu,
                color: Colors.black,
                size: 28,
              ),
            )
          ],

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: 
        [ Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(fontSize: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        width: 0, 
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                    contentPadding: EdgeInsets.only(left: 30,),
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: 24.0, left: 16.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child:
                   Column(
                    children:[

                      // Padding(
                      //   padding: EdgeInsets.all(16),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [

                      //       Text(
                      //         "TOP DEALS",
                      //         style: TextStyle(
                      //           fontSize: 22,
                      //           fontWeight: FontWeight.bold,
                      //           color: Colors.grey[400],
                      //         ),
                      //       ),

                      //       Row(
                      //         children: [

                      //           Text(
                      //             "view all",
                      //             style: TextStyle(
                      //               fontSize: 14,
                      //               fontWeight: FontWeight.bold,
                      //               color: kPrimaryColor,
                      //             ),
                      //           ),

                      //           SizedBox(
                      //             width: 8,
                      //           ),

                      //           Icon(
                      //             Icons.arrow_forward_ios,
                      //             size: 12,
                      //             color: kPrimaryColor,
                      //           ),

                      //         ],
                      //       ),

                      //     ],
                      //   ),
                      // ),
                      
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SlideInLeft(
                            child: Container(
                                child: "Top Deals"
                                    .text
                                    .black
                                    .size(19)
                                    .bold
                                    .make()
                                    .shimmer()),
                          ),
                          Row(
                            children: [
                              SlideInRight(
                                  child: "More".text.semiBold.blue700.make()),
                              SlideInRight(
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 17,
                                  color: Vx.blue700,
                                ).px8(),
                              ),
                            ],
                          ),
                        ],
                      ).onInkTap(() {
                        Get.to(
                          TopDeals(),
                        );
                      }),
                    ).px20(),
                      //////////////////////////////////

                      Container
                      (
                        height: MediaQuery.of(context).size.height*0.3,
                    
                          child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('cars')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData)
                              return Center(child: CircularProgressIndicator());

                            List<DocumentSnapshot>documents=snapshot.data!.docs;
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:documents.length,
                              itemBuilder: (context, index) {
                                DocumentSnapshot ds =
                                  documents[index];
                                return Container(
                                    // color: Colors.blue,
                                    height:
                                        MediaQuery.of(context).size.height * 0.27,
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: SlideInRight(
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        elevation: 3.0,
                                        child: Column(
                                          children: [
                                          SlideInLeft(
                                              child: SlideInRight(
                                                child: Container(
                                                  height: 120,
                                                  decoration: BoxDecoration(
                                                    //color: Colors.blue,
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                        ds['Image'],
                                                      ),
                                                      fit: BoxFit.fill,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(14),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            "${ds["Name"]}"
                                                .text
                                                .bold
                                                .size(18)
                                                .make()
                                                .shimmer(
                                                  primaryColor: Colors.blue,
                                                  secondaryColor: Colors.pink,
                                                ),
                                            "Rent: Rs.${ds["1monthrent"]}"
                                                .text
                                                .semiBold
                                                .make()
                                                .py8(),
                                          ],
                                         
                                        
                                      ).onInkTap(() {
                                        //Get.to(CarDetailPage(
                                         Navigator.push(context,MaterialPageRoute(builder: (context)=>CarDetailPage( 
                                        name: ds['Name'],
                                          model: ds['Model'],
                                        )),
                                         );
                                     }
                                      ),
                                    )
                                ));
                              },
                            );
                          },
                        ),
                      ),
                       BouncingWidget(
                        duration: Duration(milliseconds: 100),
                        scaleFactor: 1.5,
                        onPressed: () {
                        //  print("onPressed");
                        },
                        child: FadeInUp(
                          child: Container(
                              decoration: BoxDecoration(
                                color: Vx.blue500,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: VStack([
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        "Available Cars"
                                            .text
                                            .bold
                                            .size(20)
                                            .white
                                            .make(),
                                        Container(
                                                child:
                                                    "Long Term And Short Term"
                                                        .text
                                                        .semiBold
                                                        .size(14)
                                                        .white
                                                        .make())
                                            .py4(),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Icon(
                                          Icons.forward,
                                          size: 17,
                                          color: Vx.blue700,
                                        ),
                                      ).px8(),
                                    )
                                  ],
                                ).p16(),
                              ])),
                        )).px24().py24(),
                    ],
                  )
                      

          
                  )
                

          ),
        ),


      ],


      

    )
    );
    
  }

  
}