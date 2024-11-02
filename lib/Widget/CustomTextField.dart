import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.onChanged,
      required this.NameText,
      this.inputType});

  final Function(String p1)? onChanged;
  final String? NameText;
  TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        keyboardType: inputType,
        onChanged: onChanged,
        decoration: InputDecoration(
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
          hintText: NameText,
          hintStyle: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
