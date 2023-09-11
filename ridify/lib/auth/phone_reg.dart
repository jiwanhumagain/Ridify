import 'package:flutter/material.dart';
import 'package:ridify/widgets/custom_buttons.dart';
import 'package:country_picker/country_picker.dart';

class PhoneRegistration extends StatefulWidget {
  const PhoneRegistration({super.key});
  @override
  State<PhoneRegistration> createState() => _PhoneRegistration();
}

class _PhoneRegistration extends State<PhoneRegistration> {
  final TextEditingController phoneController = TextEditingController();
  Country selectedCountry = Country(
    phoneCode: "977",
    countryCode: "Us",
    e164Sc: 1,
    geographic: true,
    level: 2,
    name: "Nepal",
    example: "Nepal",
    displayName: "Nepal",
    displayNameNoCountryCode: "NEP",
    e164Key: "Nep",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Image.asset(
                "assets/images/register.png",
                height: 300,
                width: 300,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Registration",
                style: TextStyle(
                  fontFamily: 'times',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Add your Phone Number to get registered",
                style: TextStyle(
                  color: Colors.black38,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    hintText: 'Enter your phone number',
                    prefixIcon: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 5,
                      ),
                      child: InkWell(
                        onTap: () {
                          showCountryPicker(
                            context: context,
                            countryListTheme: const CountryListThemeData(
                              bottomSheetHeight: 500,
                            ),
                            onSelect: (value) {
                              setState(() {
                                selectedCountry = value;
                              });
                            },
                          );
                        },
                        child: Text(
                            "${selectedCountry.flagEmoji}+${selectedCountry.phoneCode}"),
                      ),
                    ),
                    suffixIcon: phoneController.text.length == 10
                        ? Container(
                           padding: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 3,
                            ),
                            height: 5,
                            width: 5,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.greenAccent,
                            ),
                            child: const Icon(
                              Icons.done,
                              color: Colors.white,
                              size: 10,
                            ),
                          )
                        : Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 3,
                            ),
                            height: 4,
                            width: 2,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.greenAccent,
                            ),
                            child: const Icon(
                              Icons.done,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                  ),
                  keyboardType: TextInputType.phone,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 35, vertical: 25),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: CustomButtons(buttonText: "Login"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
