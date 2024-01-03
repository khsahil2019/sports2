import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'package:file_selector/file_selector.dart'
    hide XFile; // hides to test if share_plus exports XFile
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart'
    hide XFile; // hides to test if share_plus exports XFile
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class DemoApp extends StatefulWidget {
  const DemoApp({Key? key}) : super(key: key);

  @override
  DemoAppState createState() => DemoAppState();
}

class DemoAppState extends State<DemoApp> {
  String text = '';
  String subject = '';
  String uri = '';
  List<String> imageNames = [];
  List<String> imagePaths = [];
  Future<String?> captureScreen() async {
    try {
      final imageFile = await screenshotController.capture();
      if (imageFile != null) {
        final directory = (await getApplicationDocumentsDirectory()).path;
        final imagePath = '$directory/screenshot.png';
        File(imagePath).writeAsBytesSync(imageFile);
        return imagePath;
      } else {
        return null;
      }
    } catch (e) {
      print("Error capturing the screen: $e");
      return null;
    }
  }

  ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Share Plus Plugin Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0x9f4376f8),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Share Plus Plugin Demo'),
          elevation: 4,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Share text',
                  hintText: 'Enter some text and/or link to share',
                ),
                maxLines: null,
                onChanged: (String value) => setState(() {
                  text = value;
                }),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Share subject',
                  hintText: 'Enter subject to share (optional)',
                ),
                maxLines: null,
                onChanged: (String value) => setState(() {
                  subject = value;
                }),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Share uri',
                  hintText: 'Enter the uri you want to share',
                ),
                maxLines: null,
                onChanged: (String value) {
                  setState(() => uri = value);
                },
              ),
              const SizedBox(height: 16),
              ImagePreviews(imagePaths, onDelete: _onDeleteImage),
              ElevatedButton.icon(
                label: const Text('Add image'),
                onPressed: () async {
                  // Using `package:image_picker` to get image from gallery.
                  if (!kIsWeb &&
                      (Platform.isMacOS ||
                          Platform.isLinux ||
                          Platform.isWindows)) {
                    // Using `package:file_selector` on windows, macos & Linux, since `package:image_picker` is not supported.
                    const XTypeGroup typeGroup = XTypeGroup(
                      label: 'images',
                      extensions: <String>['jpg', 'jpeg', 'png', 'gif'],
                    );
                    final file = await openFile(
                        acceptedTypeGroups: <XTypeGroup>[typeGroup]);
                    if (file != null) {
                      setState(() {
                        imagePaths.add(file.path);
                        imageNames.add(file.name);
                      });
                    }
                  } else {
                    final imagePicker = ImagePicker();
                    final pickedFile = await imagePicker.pickImage(
                      source: ImageSource.gallery,
                    );
                    if (pickedFile != null) {
                      setState(() {
                        imagePaths.add(pickedFile.path);
                        imageNames.add(pickedFile.name);
                      });
                    }
                  }
                },
                icon: const Icon(Icons.add),
              ),
              const SizedBox(height: 32),

              // ),
              const SizedBox(height: 16),
              Builder(
                builder: (BuildContext context) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    onPressed: () async {
                      String? capturedImagePath = await captureScreen();

                      if (text.isEmpty && imagePaths.isEmpty) {
                        print("object is good ");
                      } else {
                        _onShareWithResult(context);
                      }
                    },
                    // onPressed: text.isEmpty && imagePaths.isEmpty
                    //     ? null
                    //     : () => _onShareWithResult(context),
                    child: const Text('Share With Result'),
                  );
                },
              ),
              const SizedBox(height: 16),
              // Builder(
              //   builder: (BuildContext context) {
              //     return ElevatedButton(
              //       style: ElevatedButton.styleFrom(
              //         foregroundColor: Theme.of(context).colorScheme.onPrimary,
              //         backgroundColor: Theme.of(context).colorScheme.primary,
              //       ),
              //       onPressed: () {
              //         _onShareXFileFromAssets(context);
              //       },
              //       child: const Text('Share XFile from Assets'),
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void _onDeleteImage(int position) {
    setState(() {
      imagePaths.removeAt(position);
      imageNames.removeAt(position);
    });
  }

  void _onShare(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;

    if (uri.isNotEmpty) {
      await Share.shareUri(Uri.parse(uri));
    } else if (imagePaths.isNotEmpty) {
      final files = <XFile>[];
      for (var i = 0; i < imagePaths.length; i++) {
        files.add(XFile(imagePaths[i], name: imageNames[i]));
      }
      await Share.shareXFiles(files,
          text: text,
          subject: subject,
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
    } else {
      await Share.share(text,
          subject: subject,
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
    }
  }

  void _onShareWithResult(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    ShareResult shareResult;
    if (imagePaths.isNotEmpty) {
      final files = <XFile>[];
      for (var i = 0; i < imagePaths.length; i++) {
        files.add(XFile(imagePaths[i], name: imageNames[i]));
      }
      shareResult = await Share.shareXFiles(files,
          text: text,
          subject: subject,
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
    } else {
      shareResult = await Share.shareWithResult(text,
          subject: subject,
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
    }
    scaffoldMessenger.showSnackBar(getResultSnackBar(shareResult));
  }

  void _onShareXFileFromAssets(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final data = await rootBundle.load('assets/flutter_logo.png');
    final buffer = data.buffer;
    final shareResult = await Share.shareXFiles(
      [
        XFile.fromData(
          buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
          name: 'flutter_logo.png',
          mimeType: 'image/png',
        ),
      ],
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
    );

    scaffoldMessenger.showSnackBar(getResultSnackBar(shareResult));
  }

  SnackBar getResultSnackBar(ShareResult result) {
    return SnackBar(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Share result: ${result.status}"),
          if (result.status == ShareResultStatus.success)
            Text("Shared to: ${result.raw}")
        ],
      ),
    );
  }
}

class ImagePreviews extends StatelessWidget {
  final List<String> imagePaths;
  final Function(int) onDelete;

  ImagePreviews(this.imagePaths, {required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: imagePaths
          .map((path) => ListTile(
                leading: Image.file(
                    File(path)), // Assuming imagePaths contain file paths
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    final index = imagePaths.indexOf(path);
                    onDelete(index);
                  },
                ),
              ))
          .toList(),
    );
  }
}
