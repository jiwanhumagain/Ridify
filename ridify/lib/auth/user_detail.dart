import 'package:flutter/material.dart';
import 'package:ridify/widgets/Input_form_fields.dart';
import 'package:ridify/widgets/custom_buttons.dart';

class UserDetail extends StatefulWidget {
  const UserDetail({super.key});
  @override
  State<UserDetail> createState() => _UserDetail();
}

class _UserDetail extends State<UserDetail> {
  final TextEditingController usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // usernameController.selection = TextSelection.fromPosition(
    //   TextPosition(
    //     offset: usernameController.text.length,
    //   ),
    // );
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
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
              SizedBox(
                height: 20,
              ),
              InputFormField(
                iconType: Icon(
                  Icons.account_circle,
                  size: 30,
                  color: Colors.white,
                  fill: 0.75,
                ),
                placeHolder: "User Name",
              ),
              SizedBox(
                height: 10,
              ),
              InputFormField(
                iconType: Icon(
                  Icons.email,
                  size: 30,
                  color: Colors.white,
                  fill: 0.75,
                ),
                placeHolder: "example@example.com",
              ),
              SizedBox(
                height: 10,
              ),
              InputFormField(
                iconType: Icon(
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
                  child: CustomButtons(buttonText: "Continue"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
