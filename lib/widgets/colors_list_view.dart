import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/add_note_cubit/cubit/add_notes_cubit.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});
  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 38,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 34,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 38,
            backgroundColor: color,
          );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({
    super.key,
  });

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;
  List<Color> colors = const [
    Color(0xff96031A),
    Color(0xffFBFFFE),
    Color(0xffFAA916),
    Color(0xff49B6FF),
    Color(0xff779BE7),
    Color(0xffA480CF),
    Color(0xffD264B6),
    Color(0xffFF499E),
    Color(0xff2F242C),
    Color(0xff502274),
    Color(0xffA42CD6),
    Color(0xffC179B9),
    Color(0xffEEB4B3),
    Color(0xff4C5760),
    Color(0xff93A8AC),
    Color(0xffD7CEB2),
    Color(0xffA59E8C),
    Color(0xff66635B),
    Color(0xff1B1B1E),
    Color(0xff6D676E),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                BlocProvider.of<AddNotesCubit>(context).color = colors[index];
                setState(() {});
              },
              child: ColorItem(
                color: colors[index],
                isActive: currentIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
