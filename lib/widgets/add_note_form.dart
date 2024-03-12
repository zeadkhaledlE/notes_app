import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/add_note_cubit/cubit/add_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/colors_list_view.dart';
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
          const ColorsListView(),
          BlocBuilder<AddNotesCubit, AddNotesState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNotesLoading ? true : false,
                ontap: () {
                  CheckInformatoin(context);
                  setState(() {});
                },
              );
            },
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  void CheckInformatoin(BuildContext context) {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      var currentDate = DateTime.now();
      var formatedcurrentDate = DateFormat.yMd().add_jm().format(currentDate);
      var noteModel = NoteModel(
          title: title!,
          subtitle: subtitle!,
          date: formatedcurrentDate,
          color: Colors.blue.value);
      BlocProvider.of<AddNotesCubit>(context).addNote(noteModel);
    } else {
      autovalidate = AutovalidateMode.always;
    }
  }
}
