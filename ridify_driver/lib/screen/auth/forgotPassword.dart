import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ridify_driver/global/global.dart';
import 'package:ridify_driver/screen/auth/login.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController useremailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _submit() {
    firebaseAuth
        .sendPasswordResetEmail(email: useremailController.text.trim())
        .then((value){
          Fluttertoast.showToast(msg: "Please check email and change password");
        }).catchError((onError){
          Fluttertoast.showToast(msg: "Unable to send email");

        });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  children: [
                    Text(
                      "Forgot Password",
                      style: TextStyle(
                        fontFamily: 'times',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple.withOpacity(0.9),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
                      child: Image.asset(
                        "assets/images/register.png",
                        height: 300,
                        width: 300,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      inputFormatters: [LengthLimitingTextInputFormatter(90)],
                      decoration: InputDecoration(
                        hintText: "example@example.com",
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
                          Icons.email,
                          color: Colors.white,
                          fill: 0.75,
                          size: 30,
                        ),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email Can't be Empty";
                        }
                        if (value.length > 89) {
                          return "Email Can't be greater than 90";
                        }
                        if (value.length < 2) {
                          return "Enter the valid Email";
                        }
                        if (EmailValidator.validate(value) == true) {
                          return null;
                        }
                        return null;
                      },
                      onChanged: (text) => setState(() {
                        useremailController.text = text;
                      }),
                    ),
                    const SizedBox(
                      height: 10,
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
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.purple),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                          label: const Text("Send Link"),
                          icon: const Icon(Icons.arrow_right_alt),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Text("Already have account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.purple),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
