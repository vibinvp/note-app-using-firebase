import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:note/screens/home.dart';

class UpDate extends StatefulWidget {
  final DocumentSnapshot<Object?> notes;

  const UpDate({
    super.key,
    required this.notes,
  });

  @override
  State<UpDate> createState() => _UpDateState();
}

void update(notes) {
  final data = {'note_content': content.text, 'note_title': title.text};

  note.doc(notes.id).update(data);
}

class _UpDateState extends State<UpDate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 500,
            width: double.maxFinite,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 55),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      TextField(
                        controller: title,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            label: const Center(
                              child: Text("Title"),
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: TextField(
                          controller: content,
                          expands: true,
                          maxLines: null,
                          decoration: InputDecoration(
                            label: const Center(
                              child: Text("Content"),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey),
                            onPressed: () {
                              if (title.text.isEmpty || content.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Center(
                                            child: Text("Enter Notes"))));
                              } else {
                                print(note.id);
                                update(widget.notes);
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return const HomeScreen();
                                }));
                              }
                            },
                            child: const Text("Done")),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
