import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:note/screens/home.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}
void addnote() {
  final data = {
    'color_id': 4,
    'creation_date': '12/3/2323',
    'note_content': content.text,
    'note_title': title.text
  };
  note.add(data);
}
class _AddNoteState extends State<AddNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 55),
            child: SingleChildScrollView(
              physics: ScrollPhysics(),
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
                    height: 30,
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
                    height: 30,
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
                                    content:
                                        Center(child: Text("Enter Notes"))));
                          } else {
                            addnote();
                            title.clear();
                            content.clear();
                            Navigator.pop(context);
                          }
                        },
                        child: const Text("Done")),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
