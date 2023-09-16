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
    countryCode: "NP",
    e164Sc: 1,
    geographic: true,
    level: 2,
    name: "Nepal",
    example: "Nepal",
    displayName: "Nepal",
    displayNameNoCountryCode: "NP",
    e164Key: "NP",
  );

  @override
  Widget build(BuildContext context) {
    phoneController.selection = TextSelection.fromPosition(
      TextPosition(
        offset: phoneController.text.length,
      ),
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: TextFormField(
                  controller: phoneController,
                  onChanged: (value) {
                    setState(() {
                      phoneController.text = value;
                    });
                  },
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    hintText: 'Enter your phone number',
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(95, 50, 50, 50),
                    ),
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
                              decoration: phoneController.text.isEmpty
                                  ? const BoxDecoration()
                                  : const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                    ),
                              child: const Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 20,
                              ),
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
