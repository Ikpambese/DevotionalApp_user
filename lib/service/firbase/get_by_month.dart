import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import '../../model/doc_model.dart';

class GetMonthlyService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Documents>> getDocumentsForCurrentMonthAndYear() async {
    List<Documents> documentsList = [];

    try {
      DateTime now = DateTime.now();
      String formattedDate = DateFormat.yMMMM().format(now);

      QuerySnapshot querySnapshot = await _firestore
          .collection('DOCUMENTS')
          .where('month_year', isGreaterThanOrEqualTo: formattedDate)
          //.where('doc_date', isLessThanOrEqualTo: endOfMonth)
          .orderBy(FieldPath.documentId,
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
            month_year: data['month_year']);

        documentsList.add(document);
      }
    } catch (e) {
      print('Error fetching documents: $e');
    }

    return documentsList;
  }
}
