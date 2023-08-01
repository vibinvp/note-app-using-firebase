import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note/screens/update.dart';

import '../screens/home.dart';
import '../style/app.style.dart';

Future<dynamic> Showdialog(
    BuildContext context, DocumentSnapshot<Object?> notes) {
  

  void delete() {
   note.doc(notes.id).delete();
    Navigator.pop(context);
  }

  return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
            backgroundColor: Colors.red.shade100,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            actions: [
              SizedBox(
                height: 500,
                width: double.maxFinite,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 55),
                    child: Column(
                      children: [
                        Text(
                          notes['note_title'],
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Text(
                          notes['note_content'],
                          style: AppStyle.mainTitle,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {
                          delete();
                        },
                        icon: const Icon(
                          CupertinoIcons.delete,
                          color: Colors.red,
                          size: 35,
                        )),
                    IconButton(
                        onPressed: () {
                          title.text = notes['note_title'];
                          content.text = notes['note_content'];
                          Navigator.of(context).push(MaterialPageRoute(builder: (context){
                            return UpDate(notes: notes,);
                          }));
                          
                                  
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.red,
                          size: 35,
                        ))
                  ],
                ),
              )
            ],
          ));
}
