import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/contact_model.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 13, 71, 161),
          ),
        ),
      ),
      body: Container(
        color: Colors.black,
        child: ListView.builder(
          itemCount:
              ContactModel.model.length, // Access model directly from the class
          itemBuilder: (context, index) {
            final contact = ContactModel.model[index];
            return ListTile(
              title: Text(
                '${contact.state ?? ''}, ${contact.country ?? ''}',
                style: GoogleFonts.nunito(
                  color: Colors.deepPurpleAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(contact.address ?? ''),
              onTap: () {
                // Implement action on tile tap if needed
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(contact.country ?? ''),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Address: ${contact.address ?? ''}'),
                          const SizedBox(height: 8),
                          Text('Phone: ${contact.phone ?? ''}'),
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
              },
              trailing: Text(
                contact.phone ?? '',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              leading: const Icon(
                Icons.location_on,
                size: 40,
                color: Colors.red,
              ),
            );
          },
        ),
      ),
    );
  }
}
