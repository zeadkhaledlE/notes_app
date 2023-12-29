import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: kprimarycolor,
      decoration: InputDecoration(
        hintText: 'Titel',
        hintStyle: TextStyle(color: kprimarycolor),
        enabledBorder: buildBorder(),
        border: buildBorder(),
        focusedBorder: buildBorder(kprimarycolor),
      ),
    );
  }
}

OutlineInputBorder buildBorder([color]) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: color ?? Colors.white,
    ),
  );
}
