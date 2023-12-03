// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newlifedevotional/main.dart';
import 'package:newlifedevotional/screens/all.dart';
import 'package:newlifedevotional/screens/contact_us.dart';
import 'package:newlifedevotional/screens/monthly_devo.dart';
import 'package:newlifedevotional/screens/today_devotion.dart';
import 'package:newlifedevotional/service/provider_service.dart';
import 'package:provider/provider.dart';

import '../service/service_model.dart';

class SelectService extends StatefulWidget {
  const SelectService({super.key});

  @override
  _SelectServiceState createState() => _SelectServiceState();
}

class _SelectServiceState extends State<SelectService> {
  List<Service> services = [
    Service('Today\'s Study', 'assets/imgs/studying.png'),
    Service('Month Topics', 'assets/imgs/january.png'),
    Service('All', 'assets/imgs/schedule.png'),
    Service('Contact', 'assets/imgs/telephone.png'),
    Service('Partnership', 'assets/imgs/agreement.png'),
    Service('New Member', 'assets/imgs/add.png'),
  ];

  int selectedService = -1;

  void _copyToClipboard(BuildContext context) {
    Clipboard.setData(const ClipboardData(text: '1016265618'));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content: Text(
        'Copied to clipboard',
        style: TextStyle(color: Colors.green),
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: selectedService >= 0
          ? FloatingActionButton(
              foregroundColor: Colors.white,
              onPressed: () {
                if (selectedService == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TodayDevotional(),
                    ),
                  );
                } else if (selectedService == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MonthlyDevotionalPage(),
                    ),
                  );
                } else if (selectedService == 2) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AllDevotionalPage(),
                    ),
                  );
                } else if (selectedService == 3) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContactPage(),
                    ),
                  );
                } else if (selectedService == 4) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      // ignore: prefer_const_constructors
                      return AlertDialog(
                        title: const Text(
                          'FOR SPONSORSHIP AND PARTNERSHIP SPONSORSHIP',
                        ),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('Bank: ZENITH BANK'),
                            const SizedBox(height: 8),
                            const Text(
                                'Account name:  Gabriel Israel Ministry'),
                            const SizedBox(height: 8),

                            const Text(
                              'Account Number:  1016265618',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            GestureDetector(
                              child: const Icon(Icons.copy_rounded),
                              onTap: () {
                                _copyToClipboard(context);
                              },
                            )
                            // Add other fields here if needed
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                } else if (selectedService == 5) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      // ignore: prefer_const_constructors
                      return AlertDialog(
                        title: const Text(
                          'WE ARE HAPPY TO RECEIVE YOU',
                        ),
                        content: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                                'Kindly visit any of the church branches on the contact page \n that is closest to you'),
                            SizedBox(height: 8),

                            // Add other fields here if needed
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              backgroundColor: const Color.fromARGB(255, 13, 71, 161),
              child: const Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
            )
          : null,
      body: Container(
          color: Colors.black,
          child: Stack(
            children: [
              Positioned.fill(
                child: Opacity(
                  opacity: 0.3,
                  child:
                      Image.asset('assets/imgs/angel.jpeg', fit: BoxFit.cover),
                ),
              ),
              NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 120.0, right: 20.0, left: 20.0),
                        child: Text(
                          'Angel Gabriel\n Daily Devotional',
                          style: GoogleFonts.alegreya(
                            fontSize: 50,
                            color: const Color.fromARGB(255, 13, 71, 161),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ];
                },
                body: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1.0,
                                crossAxisSpacing: 20.0,
                                mainAxisSpacing: 20.0,
                              ),
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: services.length,
                              itemBuilder: (BuildContext context, int index) {
                                return serviceContainer(
                                    services[index].imageURL,
                                    services[index].name,
                                    index);
                              }),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.logout_rounded,
                            color: Color.fromARGB(255, 13, 71, 161),
                          ),
                          onPressed: () {
                            userProvider.signOut().then((value) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AuthChecker(),
                                ),
                              );
                            });
                          },
                        ),
                      ]),
                ),
              ),
            ],
          )),
    );
  }

  serviceContainer(String image, String name, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (selectedService == index) {
            selectedService = -1;
          } else {
            selectedService = index;
          }
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: selectedService == index
              ? Colors.blue.shade50
              : Colors.grey.shade100,
          border: Border.all(
            color: selectedService == index
                ? const Color.fromARGB(255, 13, 71, 161)
                : const Color.fromARGB(255, 13, 71, 161).withOpacity(0),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(image, height: 80),
              const SizedBox(
                height: 20,
              ),
              Text(
                name,
                style: const TextStyle(fontSize: 20),
              )
            ]),
      ),
    );
  }
}
