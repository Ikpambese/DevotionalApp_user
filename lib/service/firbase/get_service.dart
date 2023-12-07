import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/doc_model.dart';

class GetService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Documents>> getDocuments() async {
    List<Documents> documentsList = [];

    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('DOCUMENTS')
          .orderBy('doc_date',
              descending: false) // Sort by document ID in ascending order
          .get();

      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;

        Documents document = Documents(
          doc_title: data['doc_title'],
          doc_url: data['doc_url'],
          doc_date: data['doc_date'],
          page_num: data['page_num'],
        );

        documentsList.add(document);
      }
    } catch (e) {
      print('Error fetching documents: $e');
    }

    return documentsList;
  }
}
