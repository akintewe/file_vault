import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

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
    _file = File(widget.file.path!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.file.name),
      ),
      body: FutureBuilder(
        future: _file.readAsBytes(),
        builder: (context, AsyncSnapshot<List<int>> snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Text(
                String.fromCharCodes(snapshot.data!),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
