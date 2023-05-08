import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:file_vault/app/views/save_text/savetext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../filescreen/filescreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? _file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Welcome  ' + FirebaseAuth.instance.currentUser!.displayName!,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
          CardWidget(
            image: 'assets/images/folder.png',
            title: 'Upload files',
            onpressed: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles();
              if (result != null && result.files.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FileScreen(file: result.files.single),
                  ),
                );
              }
            },
          ),
          SizedBox(
            height: 50,
          ),
          // CardWidget(
          //   image: 'assets/images/folder.png',
          //   title: 'Upload files',
          //   onpressed: () async {
          //     FilePickerResult? result =
          //         await FilePicker.platform.pickFiles();
          //     if (result != null && result.files.isNotEmpty) {
          //       setState(() {
          //         _file = File(result.files.single.path!);
          //       });
          //     }
          //   },
          // ),
          // SizedBox(
          //   height: 50,
          // ),
          // if (_file != null)
          //   Expanded(
          //     child: SfPdfViewer.file(
          //       _file!,
          //       enableTextSelection: true,
          //       enableDocumentLinkAnnotation: true,
          //       canShowScrollHead: true,
          //     ),
          //   ),
          // if (_file == null)
          //   Expanded(
          //     child: Placeholder(),
          //   ),
          CardWidget(
            image: 'assets/images/font.png',
            title: 'Save text',
            onpressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TodoList()),
              );
            },
          )
        ],
      ),
    );
  }
}

class CardWidget extends StatefulWidget {
  final VoidCallback? onpressed;
  final String title;
  final String image;
  const CardWidget(
      {super.key, this.onpressed, required this.title, required this.image});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              elevation: 3,
              shadowColor: Colors.grey),
          onPressed: widget.onpressed,
          child: Column(
            children: [
              Image.asset(widget.image),
              Text(
                widget.title,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 19),
              )
            ],
          )),
    );
  }
}
