// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:newlifedevotional/model/doc_model.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ReaderPage extends StatefulWidget {
  ReaderPage({required this.doc, super.key});
  Documents doc;
  @override
  State<ReaderPage> createState() => _ReaderPageState();
}

class _ReaderPageState extends State<ReaderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          widget.doc.doc_date!,
          style: const TextStyle(color: Colors.deepPurple),
        ),
      ),
      body: SfPdfViewer.network(
        widget.doc.doc_url!,
        canShowPaginationDialog: true,
        canShowPageLoadingIndicator: true,
        pageLayoutMode: PdfPageLayoutMode.single,
      ),
    );
  }
}
