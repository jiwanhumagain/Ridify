import 'package:flutter/material.dart';
import 'package:ridify/widgets/Input_form_fields.dart';
import 'package:ridify/screen/rent.dart';

class UserDetail extends StatefulWidget {
  const UserDetail({super.key});
  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  final TextEditingController usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // usernameController.selection = TextSelection.fromPosition(
    //   TextPosition(
    //     offset: usernameController.text.length,
    //   ),
    // );
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(50.0),
                child: CircleAvatar(
                  backgroundColor: Colors.purple,
                  radius: 65,
                  child: Icon(
                    Icons.account_circle,
                    size: 65,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InputFormField(
                iconType:const Icon(
                  Icons.account_circle,
                  size: 30,
                  color: Colors.white,
                  fill: 0.75,
                ),
                placeHolder: "User Name",
              ),
             const  SizedBox(
                height: 10,
              ),
              InputFormField(
                iconType:const  Icon(
                  Icons.email,
                  size: 30,
                  color: Colors.white,
                  fill: 0.75,
                ),
                placeHolder: "example@example.com",
              ),
             const  SizedBox(
                height: 10,
              ),
              InputFormField(
                iconType: const Icon(
                  Icons.edit,
                  size: 30,
                  color: Colors.white,
                  fill: 0.75,
                ),
                placeHolder: "Edit Your Bio Here",
              ),
               Padding(
                padding: EdgeInsets.symmetric(horizontal: 35, vertical: 45),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Rental(),
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
                    label: const Text("Continue"),
                    icon: const Icon(Icons.arrow_right_alt),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
