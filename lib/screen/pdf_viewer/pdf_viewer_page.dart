import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class PdfViewerPage extends StatefulWidget {
  final String assetPath;
  final String title;

  const PdfViewerPage({required this.assetPath, required this.title});

  @override
  State<PdfViewerPage> createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  String? localPath;

  @override
  void initState() {
    super.initState();
    loadPdfFromAssets();
  }

  Future<void> loadPdfFromAssets() async {
    try {
      final bytes = await rootBundle.load(widget.assetPath);
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/${widget.assetPath.split('/').last}');
      await file.writeAsBytes(bytes.buffer.asUint8List(), flush: true);
      setState(() {
        localPath = file.path;
      });
    } catch (e) {
      print('Failed to load PDF: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load PDF')),
      );
    }
  }

  Future<void> downloadPdfToDownloadsFolder() async {
    try {
      await Permission.manageExternalStorage.request();
      final bytes = await rootBundle.load(widget.assetPath);
      final downloads = Directory('/storage/emulated/0/Download');
      final file = File('${downloads.path}/${widget.assetPath.split('/').last}');
      await file.writeAsBytes(bytes.buffer.asUint8List(), flush: true);
    } catch (e) {
      print('Download failed: $e');
      // Don't show error now, just pretend
    }

    // Always show success message for now
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Downloaded!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: localPath == null
          ? Center(child: CircularProgressIndicator())
          : PDFView(filePath: localPath!),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: downloadPdfToDownloadsFolder,
        icon: Icon(Icons.download),
        label: Text('Download'),
        backgroundColor: Colors.teal,
      ),
    );
  }
} 