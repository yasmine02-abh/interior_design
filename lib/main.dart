import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const RoomAIApp());
}

class RoomAIApp extends StatelessWidget {
  const RoomAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future pickImage(ImageSource source) async {
    final picked = await _picker.pickImage(source: source);

    if (picked == null) return;

    setState(() {
      _image = File(picked.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Room AI Classifier"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image == null
                ? const Text("No image selected")
                : Image.file(_image!, height: 250),

            const SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: () => pickImage(ImageSource.camera),
              icon: const Icon(Icons.camera_alt),
              label: const Text("Take a Photo"),
            ),

            const SizedBox(height: 10),

            ElevatedButton.icon(
              onPressed: () => pickImage(ImageSource.gallery),
              icon: const Icon(Icons.photo_library),
              label: const Text("Upload from Gallery"),
            ),
          ],
        ),
      ),
    );
  }
}
