import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hinttext, this.maxlines = 1});
  final String hinttext;
  final int maxlines;
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxlines,
      cursorColor: kprimarycolor,
      decoration: InputDecoration(
        hintText: hinttext,
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
