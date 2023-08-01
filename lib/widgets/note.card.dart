import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../style/app.style.dart';

class NoteCard extends StatefulWidget {
  final String title;
  final String mainTitle;
  final int index ;
  const NoteCard({super.key, required this.index, required this.title, required this.mainTitle});

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: ontap,
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            //color: Colors.green,
             color: AppStyle.cardColor[widget.index],
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Text(
                      "12-05-2023",
                      style: AppStyle.dateTitle,
                    ),
                    Text(
                      "8:30 AM",
                      style: AppStyle.dateTitle,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              widget.title,
              style: AppStyle.mainTitle,
            ),
             const SizedBox(
              height: 20,
            ),
            Text(
              widget.mainTitle,
              style: AppStyle.mainTitle,
            ),
          ],
        ),
      ),
    );
  }
}
