import 'package:flutter/material.dart';

class InputFormField extends StatelessWidget {
  const InputFormField(
      {super.key, required this.iconType, required this.placeHolder});
  final String placeHolder;
  final Widget iconType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: Colors.purple.shade50,
        filled: true,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        hintText: placeHolder,
        hintStyle: const TextStyle(
          color: Color.fromARGB(95, 50, 50, 50),
        ),
        prefixIcon: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.purple,
          ),
          child: iconType,
        ),
      ),
    );
  }
}
