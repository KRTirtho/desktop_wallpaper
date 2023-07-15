import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:desktop_wallpaper/desktop_wallpaper.dart';
import 'package:collection/collection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Wallpaper.initialize();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? _image;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final wp = await Wallpaper.get();
      setState(() {
        _image = wp;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Native Packages'),
        ),
        body: Column(
          children: [
            if (_image != null)
              Image.file(
                File(_image!),
                height: 200,
                width: 200,
              ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _image ?? 'N/A',
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  child: const Text("Browse"),
                  onPressed: () async {
                    final file = await FilePicker.platform.pickFiles(
                      allowMultiple: false,
                      type: FileType.image,
                      dialogTitle: 'Select Wallpaper',
                    );

                    if (file?.files.firstOrNull?.path == null) return;
                    await Wallpaper.set(
                      file!.files.first.path!,
                    );
                    setState(() {
                      _image = file.files.first.path!;
                    });
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
