import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:note/style/app.style.dart';
import 'package:note/widgets/note.card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/showdialog.dart';
import 'addnote.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

final TextEditingController title = TextEditingController();
final TextEditingController content = TextEditingController();

final CollectionReference note = FirebaseFirestore.instance.collection('notes');
void addnote() {
  final data = {
    'color_id': 4,
    'creation_date': '12/3/2323',
    'note_content': content.text,
    'note_title': title.text
  };
  note.add(data);
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.minColor,
      appBar: AppBar(
        backgroundColor: AppStyle.minColor,
        title: Text("NoteSync"),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Recent notes",
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: note.snapshots(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.data!.docs.length == 0) {
                    return Center(
                      child: Text(
                        "No Notes",
                        style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    );
                  }

                  if (snapshot.hasData) {
                    return GridView.builder(
                      itemCount: snapshot.data!.docs.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        final DocumentSnapshot notes =
                            snapshot.data.docs[index];
                        return InkWell(
                          onTap: () {
                            Showdialog(context, notes);
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                //color: Colors.green,
                                color: AppStyle.cardColor[index],
                                borderRadius: BorderRadius.circular(5)),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  notes['note_title'],
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  style: AppStyle.mainTitle,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Expanded(
                                  child: Text(
                                    notes['note_content'],
                                    textAlign: TextAlign.center,
                                    style: AppStyle.mainContent,
                                    maxLines: 6,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: 40,
        width: 110,
        child: FloatingActionButton(
          backgroundColor: Colors.green,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          onPressed: () {
            title.clear();
            content.clear();
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return AddNote();
            }));
          },
          child: const Text(" Add note"),
        ),
      ),
    );
  }
}
