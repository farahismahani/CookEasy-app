import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;

class LessonPlanViewer extends StatefulWidget {
  final String title;
  final String filename;

  LessonPlanViewer({required this.title, required this.filename});

  @override
  _LessonPlanViewerState createState() => _LessonPlanViewerState();
}

class _LessonPlanViewerState extends State<LessonPlanViewer> {
  String? localPath;

  @override
  void initState() {
    super.initState();
    preparePdf();
  }

  Future<void> preparePdf() async {
    final bytes = await rootBundle.load('assets/pdfs/${widget.filename}');
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/${widget.filename}');
    await file.writeAsBytes(bytes.buffer.asUint8List(), flush: true);

    setState(() {
      localPath = file.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color(0xFFBCE7D6),
      ),
      body: localPath == null
          ? Center(child: CircularProgressIndicator())
          : PDFView(filePath: localPath!),
    );
  }
}
