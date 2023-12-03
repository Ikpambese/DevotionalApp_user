import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newlifedevotional/model/doc_model.dart';
import 'package:newlifedevotional/screens/reader_screen.dart';
import '../service/firbase/get_service.dart';
// Import your GetService class file

class AllDevotionalPage extends StatefulWidget {
  @override
  State<AllDevotionalPage> createState() => _AllDevotionalPageState();
}

class _AllDevotionalPageState extends State<AllDevotionalPage> {
  final GetService getService = GetService();
  late Future<List<Documents>> documentsFuture;

  @override
  void initState() {
    super.initState();
    documentsFuture = getService.getDocuments();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            onPressed: () {},
            icon: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Color.fromARGB(255, 13, 71, 161),
              ),
            ),
          ),
        ),
        body: Container(
            color: Colors.black,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Opacity(
                    opacity: 0.3,
                    child: Image.asset('assets/imgs/angel.jpeg',
                        fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'All Devotionals',
                          style: GoogleFonts.roboto(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Expanded(
                          child: FutureBuilder<List<Documents>>(
                            future: documentsFuture,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return Center(
                                    child: Text('Error: ${snapshot.error}'));
                              } else if (!snapshot.hasData ||
                                  snapshot.data!.isEmpty) {
                                return const Center(
                                    child: Text('No documents available'));
                              } else {
                                return ListView.builder(
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) {
                                    final doc = snapshot.data![index];
                                    return ListTile(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ReaderPage(doc: doc),
                                          ),
                                        );
                                      },
                                      title: Row(
                                        children: [
                                          const Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 150,
                                            child: Text(
                                              doc.doc_title!.toUpperCase(),
                                              style: GoogleFonts.nunito(
                                                color: Colors.deepPurpleAccent,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          )
                                        ],
                                      ),
                                      subtitle: Text("${doc.page_num!} Pages"),
                                      trailing: Text(
                                        doc.doc_date!,
                                        style: GoogleFonts.nunito(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      leading: const Icon(
                                        Icons.picture_as_pdf,
                                        size: 50,
                                        color: Colors.red,
                                      ),
                                    );
                                  },
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
