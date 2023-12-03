import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:intl/intl.dart';

String imagePath = '';
String title = '';
String docDate = '';
String verse = '';
String content = '';
String confession = '';
String confessionHead = '';
String furtherReading = '';

class TodayDevotional extends StatefulWidget {
  @override
  State<TodayDevotional> createState() => _TodayDevotionalState();
}

class _TodayDevotionalState extends State<TodayDevotional> {
  FlutterTts flutterTts = FlutterTts();
  Future<void> _speak() async {
    setState(() {});

    await flutterTts.setLanguage('en-US');
    await flutterTts.setSpeechRate(0.3);
    await flutterTts.setVolume(1.0);
    await flutterTts.setPitch(1.0);

    await flutterTts.speak(content);
    setState(() {});
  }

  Future<void> _pause() async {
    await flutterTts.pause();
    setState(() {});
  }

  bool _isLoading = true; // Add a boolean to track loading state

  DateTime today = DateTime.now();
  String formattedDate = '';

  Future<void> getToday() async {
    formattedDate = DateFormat('E MMM d y').format(today);
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('devotionalToday')
              .where('docDate',
                  isEqualTo: formattedDate) // Match formatted date
              .get();

      if (querySnapshot.docs.isNotEmpty) {
        final Map<String, dynamic> data = querySnapshot.docs.first.data();
        setState(() {
          // Update state with fetched data
          confession = data['confession'];
          confessionHead = data['confessionHead'];
          furtherReading = data['furtherReading'];
          content = data['longText'];
          imagePath = data['imgurl'];
          verse = data['scriptureReference'];
          title = data['title'];
          docDate = data['docDate'];
          _isLoading = false; // Update loading state when data is fetched
        });
      }
    } catch (e) {
      print('Error fetching data: $e');
      _isLoading = false; // Handle loading state in case of error
    }
  }

  @override
  void initState() {
    getToday();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 200,
                    color: Colors.white,
                    child: CachedNetworkImage(
                      imageUrl: imagePath,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(
                          child:
                              CircularProgressIndicator()), // Placeholder widget while loading
                      errorWidget: (context, url, error) => const Icon(
                          Icons.error), // Widget to show in case of error
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.white38,
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  docDate,
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  title,
                                  maxLines: 6,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.black,
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  verse,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  confession,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic,
                                  ),
                                  maxLines: 6,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              IconButton.outlined(
                                onPressed: () {
                                  _speak();
                                },
                                icon: const Icon(Icons.speaker),
                              ),
                              const SizedBox(width: 10),
                              IconButton.outlined(
                                onPressed: () {
                                  _pause();
                                },
                                icon: const Icon(Icons.pause),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  if (content.isNotEmpty)
                                    TextSpan(
                                      text:
                                          content.substring(0, 1).toUpperCase(),
                                      style: const TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 32,
                                      ),
                                    ),
                                  if (content.length > 1)
                                    TextSpan(
                                      text: content.substring(1),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 2,
                                  color: Colors.black,
                                  offset: Offset.infinite,
                                  spreadRadius: 2,
                                ),
                              ],
                              color: Colors.black,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          confessionHead,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25,
                                              color: Colors.white30),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          confession,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 10, 10, 20),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white, // Border color
                                        width: 2.0, // Border width
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'FURTHER READING',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          furtherReading,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
