import 'package:email_validator/email_validator.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ridify/global/global.dart';
// import 'package:ridify/screen/auth/forgotPassword.dart';
import 'package:ridify/screen/auth/login.dart';

class UserDetail extends StatefulWidget {
  const UserDetail({super.key});
  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController useremailController = TextEditingController();
  final TextEditingController userpasswordController = TextEditingController();
  final TextEditingController userbioController = TextEditingController();
  final TextEditingController userphoneController = TextEditingController();

  bool _passwordVisible = false;

  final _formKey = GlobalKey<FormState>();

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      await firebaseAuth
          .createUserWithEmailAndPassword(
        email: useremailController.text.trim(),
        password: userpasswordController.text.trim(),
      )
          .then((auth) async {
        currentUser = auth.user;
        if (currentUser != null) {
          Map userMap = {
            "id": currentUser!.uid,
            "name": usernameController.text.trim(),
            "email": useremailController.text.trim(),
            "bio": userbioController.text.trim(),
            "phone": userphoneController.text.trim()
          };
          DatabaseReference userRef =
              FirebaseDatabase.instance.ref().child("users");
          userRef.child(currentUser!.uid).set(userMap);
        }
        await Fluttertoast.showToast(msg: "Successfully Data Added");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      }).catchError((errorMessage) {
        Fluttertoast.showToast(msg: "Error Occured:\n $errorMessage");
      });
    } else {
      Fluttertoast.showToast(msg: "Not All Fields are vallid");
    }
  }

  @override
  Widget build(BuildContext context) {
    // usernameController.selection = TextSelection.fromPosition(
    //   TextPosition(
    //     offset: usernameController.text.length,
    //   ),
    // );
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
                      "Enter your Details Here",
                      style: TextStyle(
                        fontFamily: 'times',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple.withOpacity(0.9),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
                      child: CircleAvatar(
                        backgroundColor: Colors.purple,
                        radius: 45,
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
                    TextFormField(
                      inputFormatters: [LengthLimitingTextInputFormatter(30)],
                      decoration: InputDecoration(
                        hintText: "User Name",
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
                          return "User Name Can't be Empty";
                        }
                        if (value.length > 29) {
                          return "User Name Can't be greater than 30";
                        }
                        if (value.length < 2) {
                          return "Enter the valid User Name";
                        }
                      },
                      onChanged: (text) => setState(() {
                        usernameController.text = text;
                        print(usernameController);
                      }),
                    ),
                    const SizedBox(
                      height: 10,
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
                      },
                      onChanged: (text) => setState(() {
                        useremailController.text = text;
                      }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: userphoneController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Your Phone number";
                        } else if (value.length < 10) {
                          return "Your number must be length of 10";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(
                          () {
                            userphoneController.text = value;
                          },
                        );
                      },
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(40),
                          ),
                        ),
                        hintText: 'Enter your phone number',
                        hintStyle: TextStyle(
                          color: Colors.grey.shade500,
                        ),
                        filled: true,
                        fillColor: Colors.purple.shade100,
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Colors.white,
                          fill: 0.75,
                          size: 30,
                        ),
                        suffixIcon: userphoneController.text.length == 10
                            ? Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: Container(
                                  height: 2,
                                  width: 2,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green,
                                  ),
                                  child: const Icon(
                                    Icons.done,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: Container(
                                  height: 5,
                                  width: 5,
                                  decoration: userphoneController.text.isEmpty
                                      ? const BoxDecoration()
                                      : const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.red,
                                        ),
                                  child: userphoneController.text.length==0? const Icon(
                                    Icons.close,
                                    color: Colors.purple,
                                    size: 20,
                                  ):const Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 20,
                                  )
                                ),
                              ),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter Your Bio Here",
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
                          Icons.edit,
                          color: Colors.white,
                          fill: 0.75,
                          size: 30,
                        ),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onChanged: (text) => setState(() {
                        userbioController.text = text;
                      }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      obscureText: !_passwordVisible,
                      inputFormatters: [LengthLimitingTextInputFormatter(50)],
                      decoration: InputDecoration(
                        hintText: "Password",
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
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Colors.white,
                          fill: 0.75,
                          size: 30,
                        ),
                        suffixIcon: IconButton(
                            icon: Icon(
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.white,
                              fill: 0.75,
                              size: 30,
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            }),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password Can't be Empty";
                        }
                        if (value.length > 89) {
                          return "Password Can't be greater than 50";
                        }
                        if (value.length < 6) {
                          return "Enter the valid password";
                        }
                        return null;
                      },
                      onChanged: (text) => setState(() {
                        userpasswordController.text = text;
                      }),
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
                          label: const Text("Continue"),
                          icon: const Icon(Icons.arrow_right_alt),
                        ),
                      ),
                    ),
                    Row(
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
