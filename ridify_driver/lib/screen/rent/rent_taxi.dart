import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:email_validator/email_validator.dart';

final formatter = DateFormat.yMd();

class RentTaxiForm extends StatefulWidget {
  const RentTaxiForm({super.key});

  @override
  State<RentTaxiForm> createState() => _RentTaxiFormState();
}

class _RentTaxiFormState extends State<RentTaxiForm> {
  final _titleController = TextEditingController();
  final _emailController = TextEditingController();
  final _noofPersonController = TextEditingController();
  final _noofDaysController = TextEditingController();
  var _selectedValue = 'Car-3 Seater';

  DateTime? _selectedDate;
  String _errorMessage = '';

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year, now.month, now.day);

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: DateTime(now.year, now.month + 6, now.day),
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }
  void validateEmail(String val) {
    if(val.isEmpty){
  setState(() {
    _errorMessage = "Email can not be empty";
  });
    }else if(!EmailValidator.validate(val, true)){
      setState(() {
        _errorMessage = "Invalid Email Address";
      });
    }else{
      setState(() {

        _errorMessage = "";
      });
    }
  }

  void _submitExpenseDate() {
    final enteredNoOfPearson = double.tryParse(_noofPersonController.text);
    final enteredNoOfPearsonIsInvalid = enteredNoOfPearson == null || enteredNoOfPearson <= 0||enteredNoOfPearson>14;

    final enteredDays=double.tryParse(_noofDaysController.text);
    final enteredDaysIsInvalid =enteredDays ==null || enteredDays<=0 || enteredDays>=50;

    if (_titleController.text.trim().isEmpty ||
       enteredNoOfPearsonIsInvalid ||enteredDaysIsInvalid||
        _selectedDate == null||_emailController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Invalid Input"),
          content:
              const Text("Please make sure all the parameters are correct"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text("Okay"),
            )
          ],
        ),
      );
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Center(
        // child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextField(
                  // onChanged: _saveTitleInput,
                  controller: _titleController,
                  maxLength: 50,
                  decoration: InputDecoration(
                    label: Title(
                      color: Colors.green,
                      child: const Text("Name"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  // onChanged: _saveTitleInput,
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    label: Title(
                      color: Colors.green,
                      child: const Text("Email"),
                    ),
                    hintText: "example@example.com",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        // onChanged: _saveTitleInput,
                        controller: _noofPersonController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Title(
                            color: Colors.green,
                            child: const Text("Number of Person"),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                          children: [
                            DropdownButton(
                              value: _selectedValue,
                              items: const [
                                DropdownMenuItem(
                                  value: "Car-3 Seater",
                                  child: Text(
                                    "Car-3 Seater",
                                    style: TextStyle(fontWeight: FontWeight.w300),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: "Jeep-3 Seater",
                                  child: Text(
                                    "Jeep-3 Seater",
                                    style: TextStyle(fontWeight: FontWeight.w300),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: "Hiace Van-14 Seater",
                                  child: Text(
                                    "Hiace Van-14 Seater",
                                    style: TextStyle(fontWeight: FontWeight.w300),
                                  ),
                                ),
                              ],
                              onChanged: (value) {
                                if (value == null) {
                                  return;
                                }
                                setState(
                                  () {
                                    _selectedValue = value;
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextField(
                          // onChanged: _saveTitleInput,
                          controller: _noofDaysController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            label: Title(
                              color: Colors.green,
                              child: const Text("Number of Days"),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        _selectedDate == null
                            ? 'Select Starting Date'
                            : formatter.format(_selectedDate!),
                      ),
                      IconButton(
                        onPressed: _presentDatePicker,
                        icon: const Icon(Icons.calendar_month),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Cancel",
                      ),
                    ),
                    ElevatedButton(
                      // onPressed: () {
                      //   print(_enteredTitle);
                      // },
                      onPressed: _submitExpenseDate,
                      child: Text("Book Now"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        // ),
      ),
    );
  }
}
