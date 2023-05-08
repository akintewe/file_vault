import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class FileScreen extends StatefulWidget {
  final PlatformFile file;

  const FileScreen({Key? key, required this.file}) : super(key: key);

  @override
  _FileScreenState createState() => _FileScreenState();
}

class _FileScreenState extends State<FileScreen> {
  late File _file;

  @override
  void initState() {
    super.initState();

    // Convert the PlatformFile to a File object
    _file = File(widget.file.path!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: SfPdfViewer.file(
        _file,
        enableTextSelection: true,
        enableDocumentLinkAnnotation: true,
        canShowScrollHead: true,
      ),
    );
  }
}
