import 'package:email_validator/email_validator.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ridify/global/global.dart';
import 'package:ridify/maps/mapbox.dart';
import 'package:ridify/screen/auth/forgotPassword.dart';
import 'package:ridify/screen/auth/user_detail.dart';
import 'package:ridify/screen/rent.dart';
import 'package:ridify/screen/splashscreen/splash.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController useremailController = TextEditingController();
  final TextEditingController userpasswordController = TextEditingController();
  bool _passwordVisible = false;

  final _formKey = GlobalKey<FormState>();
   void _submit() async {
    if (_formKey.currentState!.validate()) {
      await firebaseAuth
          .signInWithEmailAndPassword(
        email: useremailController.text.trim(),
        password: userpasswordController.text.trim(),
      )
          .then((auth) async {
            DatabaseReference userRef =
            FirebaseDatabase.instance.ref().child("users");
        userRef.child(firebaseAuth.currentUser!.uid).once().then((value) async {
          final snap = value.snapshot;
          if (snap.value != null) {
            currentUser = auth.user;
            await Fluttertoast.showToast(msg: "successfully Logged In");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (c) => Rental(),
              ),
            );
          }
          else{
             await Fluttertoast.showToast(msg: "Error Occured Please Enter Valid Email and Password");
             firebaseAuth.signOut();
            
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (c) => SplashScreen(),
              ),
            );
          }
        });

      }).catchError((errorMessage) {
        Fluttertoast.showToast(msg: "Error Occured:\n $errorMessage");
      });
    } else {
      Fluttertoast.showToast(msg: "Not All Fields are vallid");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
       child:Scaffold(
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
                      "Login",
                      style: TextStyle(
                        fontFamily: 'times',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple.withOpacity(0.9),
                      ),
                    ),
                     Padding(
                      padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
                      child:  Image.asset(
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
                      },
                      onChanged: (text) => setState(() {
                        useremailController.text = text;
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
                      padding:
                          EdgeInsets.fromLTRB(20, 20, 20, 0),
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
                          label: const Text("Login"),
                          icon: const Icon(Icons.arrow_right_alt),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgotPassword(),
                          ),
                        );
                      },
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(color: Colors.purple),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Text("Doesn't have account?"),
                          TextButton(onPressed: (){
                            Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const UserDetail(),
                          ),
                        );
                          }, child: Text("Register",style: TextStyle(color: Colors.purple),),),
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
