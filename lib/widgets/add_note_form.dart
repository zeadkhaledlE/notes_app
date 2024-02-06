import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidate = AutovalidateMode.disabled;
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidate,
      key: formkey,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            hinttext: 'Title',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onSaved: (value) {
              subtitle = value;
            },
            hinttext: 'Content',
            maxlines: 5,
          ),
          const SizedBox(
            height: 32,
          ),
          CustomButton(
            ontap: () {
              if (formkey.currentState!.validate()) {
                formkey.currentState!.save();
              } else {
                autovalidate = AutovalidateMode.always;
              }
              setState(() {});
            },
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
