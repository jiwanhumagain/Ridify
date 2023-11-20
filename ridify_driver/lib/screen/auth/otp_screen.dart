import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:ridify_driver/global/global.dart';
import 'package:ridify_driver/screen/auth/user_detail.dart';
// import 'package:ridify/widgets/custom_buttons.dart';

class OtpCode extends StatefulWidget {
  // final String verificationId;
  // const OtpCode({Key? key, required this.verificationId});
  @override
  State<OtpCode> createState() => _OtpCodeState();
}

class _OtpCodeState extends State<OtpCode> {
  final OtpFieldController phoneController = OtpFieldController();

  // void _submit() async {
  //   final authCrendital = PhoneAuthProvider.credential(
  //       verificationId: widget.verificationId,
  //       smsCode: phoneController.toString());

  //   try {
  //     await firebaseAuth.signInWithCredential(authCrendital);
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => const UserDetail(),
  //       ),
  //     );
  //   } catch (e) {
  //     print("object    +$e");
  //     Fluttertoast.showToast(msg: "Error Occured in this otp screen");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset(
                "assets/images/otp.png",
                height: 300,
                width: 300,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Verification",
                style: TextStyle(
                  fontFamily: 'Times',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Enter The OTP Send To Your Phone",
                style: TextStyle(
                  fontFamily: 'Times',
                  color: Colors.black38,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              OTPTextField(
                controller: phoneController,
                length: 6,
                width: MediaQuery.of(context).size.width,
                fieldWidth: 40,
                style: const TextStyle(fontSize: 13),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.box,
                onCompleted: (pin) {},
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 35, vertical: 25),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    // onPressed: _submit,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UserDetail(),
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
                    label: const Text("Verify"),
                    icon: const Icon(Icons.arrow_right_alt),
                  ),
                ),
              ),
              const Text(
                "Didn't Receive any Code?",
                style: TextStyle(fontFamily: 'Times', color: Colors.black38),
              ),
              const SizedBox(
                height: 15,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Resend New Code",
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
