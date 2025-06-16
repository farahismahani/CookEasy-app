import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
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

  Future<void> saveToDownloads() async {
    final status = await Permission.storage.request();
    if (!status.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Storage permission denied')),
      );
      return;
    }

    try {
      final bytes = await rootBundle.load('assets/pdfs/${widget.filename}');
      final downloadsDir = Directory('/storage/emulated/0/Download');
      final outFile = File('${downloadsDir.path}/${widget.filename}');
      await outFile.writeAsBytes(bytes.buffer.asUint8List(), flush: true);

      print('✅ File saved to: ${outFile.path}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Saved to Downloads as ${widget.filename}')),
      );
    } catch (e) {
      print('❌ Save failed: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save: ${e.toString()}')),
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
          IconButton(
            icon: Icon(Icons.download),
            tooltip: 'Save to device',
            onPressed: saveToDownloads,
          )
        ],
      ),
      body: localPath == null
          ? Center(child: CircularProgressIndicator())
          : PDFView(filePath: localPath!),
    );
  }
}
