import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ridify_driver/global/global.dart';
import 'package:ridify_driver/screen/splashscreen/splash.dart';

class CarInfoScreen extends StatefulWidget {
  const CarInfoScreen({super.key});

  @override
  State<CarInfoScreen> createState() => _CarInfoScreenState();
}

class _CarInfoScreenState extends State<CarInfoScreen> {
  final carModelTextEditingController = TextEditingController();
  final carNumberTextEditingController = TextEditingController();
  final carColorTextEditingController = TextEditingController();

  List<String> carTypes = ["Car", "Bike"];

  String? selectedCarType;

  final _formKey = GlobalKey<FormState>();
  void _submit() {
    if (_formKey.currentState!.validate()) {
      Map driverCarInfoMap = {
        "car_model": carModelTextEditingController.text.trim(),
        "car_number": carNumberTextEditingController.text.trim(),
        "car_color": carColorTextEditingController.text.trim(),
        "car_type":selectedCarType,
      };
      DatabaseReference userRef =
          FirebaseDatabase.instance.ref().child("drivers");
      userRef
          .child(currentUser!.uid)
          .child("car_details")
          .set(driverCarInfoMap);
      Fluttertoast.showToast(msg: "Successfully Vehicle Added");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(0),
          children: [
            Column(
              children: [
                Image.asset(
                  "assets/images/taxi.png",
                  height: 300,
                  width: 300,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Add Vehicel Detail",
                  style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(50)
                          ],
                          decoration: InputDecoration(
                            hintText: "Vehicle Model",
                            hintStyle: TextStyle(
                              color: Colors.grey.shade500,
                            ),
                            filled: true,
                            fillColor: Colors.purple.shade100,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: const BorderSide(
                                  width: 0,
                                )),
                            prefixIcon: Icon(
                              Icons.person_3,
                              color: Colors.white,
                              fill: 0.75,
                              size: 30,
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Vehicle Model Can't be Empty";
                            }
                            if (value.length > 29) {
                              return "Vehicle Model Can't be greater than 30";
                            }
                            if (value.length < 2) {
                              return "Enter the valid Vehicle Model";
                            }
                            return null;
                          },
                          onChanged: (text) => setState(() {
                            carModelTextEditingController.text = text;
                          }),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(50)
                          ],
                          decoration: InputDecoration(
                            hintText: "Vehicle Number",
                            hintStyle: TextStyle(
                              color: Colors.grey.shade500,
                            ),
                            filled: true,
                            fillColor: Colors.purple.shade100,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: const BorderSide(
                                  width: 0,
                                )),
                            prefixIcon: Icon(
                              Icons.person_3,
                              color: Colors.white,
                              fill: 0.75,
                              size: 30,
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Vehicle Number Can't be Empty";
                            }
                            if (value.length > 10) {
                              return "Vehicle Number Can't be greater than 10";
                            }
                            if (value.length < 2) {
                              return "Enter the valid Vehicle Number";
                            }
                            return null;
                          },
                          onChanged: (text) => setState(() {
                            carNumberTextEditingController.text = text;
                          }),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(50)
                          ],
                          decoration: InputDecoration(
                            hintText: "Vehicle Color",
                            hintStyle: TextStyle(
                              color: Colors.grey.shade500,
                            ),
                            filled: true,
                            fillColor: Colors.purple.shade100,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: const BorderSide(
                                  width: 0,
                                )),
                            prefixIcon: Icon(
                              Icons.person_3,
                              color: Colors.white,
                              fill: 0.75,
                              size: 30,
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Vehicle Color Can't be Empty";
                            }
                            if (value.length > 10) {
                              return "Vehicle Color Can't be greater than 10";
                            }
                            if (value.length < 2) {
                              return "Enter the valid Vehicle Color";
                            }
                            return null;
                          },
                          onChanged: (text) => setState(() {
                            carColorTextEditingController.text = text;
                          }),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                hintText: "Please Choose Vehicle Type",
                                prefixIcon: Icon(
                                  Icons.car_crash,
                                  color: Colors.grey,
                                ),
                                fillColor: Colors.grey.shade200,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                              ),
                              items: carTypes.map((car) {
                                return DropdownMenuItem(
                                  child: Text(
                                    car,
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  value: car,
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  selectedCarType = newValue.toString();
                                });
                              }),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: _submit,
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.purple),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                              ),
                              label: const Text("Confirm"),
                              icon: const Icon(Icons.arrow_right_alt),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
