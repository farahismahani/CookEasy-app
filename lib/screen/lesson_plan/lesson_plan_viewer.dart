import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:printing/printing.dart';

class LessonPlanViewer extends StatefulWidget {
  final String title;
  final String filename;

  LessonPlanViewer({required this.title, required this.filename});

  @override
  _LessonPlanViewerState createState() => _LessonPlanViewerState();
}

class _LessonPlanViewerState extends State<LessonPlanViewer> {
  String? localPath;
  Uint8List? pdfBytes;

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
      pdfBytes = bytes.buffer.asUint8List();
    });
  }

  Future<void> printPdf() async {
    if (pdfBytes != null) {
      await Printing.layoutPdf(onLayout: (_) async => pdfBytes!);
    }
  }

  Future<void> sharePdf() async {
    if (pdfBytes != null) {
      await Printing.sharePdf(
        bytes: pdfBytes!,
        filename: widget.filename,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color(0xFFBCE7D6),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert),
            onSelected: (value) {
              if (value == 'print') {
                printPdf();
              } else if (value == 'share') {
                sharePdf();
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(value: 'print', child: Text('Print')),
              PopupMenuItem(value: 'share', child: Text('Share')),
            ],
          ),
        ],
      ),
      body: localPath == null
          ? Center(child: CircularProgressIndicator())
          : PDFView(filePath: localPath!),
    );
  }
}
