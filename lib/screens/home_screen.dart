import 'package:flutter/material.dart';

import '../services/file_service.dart';
import '../widgets/custom_textField.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Initialise the file service
  FileService fileService = FileService();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    removeListeners();
    super.dispose();
  }

  void addListeners() {
    List<TextEditingController> controllers = [
      fileService.titleController,
      fileService.descController,
      fileService.tagsController,
    ];

    for (TextEditingController controller in controllers) {
      controller.addListener(_onFieldChanged);
    }
  }

  void _onFieldChanged() {
    setState(
      () {
        fileService.fieldsNotEmpty =
            fileService.titleController.text.isNotEmpty &&
                fileService.descController.text.isNotEmpty &&
                fileService.tagsController.text.isNotEmpty;
      },
    );
  }

  void removeListeners() {
    List<TextEditingController> controllers = [
      fileService.titleController,
      fileService.descController,
      fileService.tagsController,
    ];

    for (TextEditingController controller in controllers) {
      controller.removeListener(_onFieldChanged);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("YT"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    _mainButton(() => null, "New File"),
                  ],
                ),
                Row(
                  children: [
                    _actionButton(() => null, Icons.file_upload),
                    _actionButton(() => null, Icons.folder),
                  ],
                )
              ],
            ),
            const SizedBox(height: 16.0),
            CustomTextField(
              maxLength: 100,
              maxLines: 1,
              hintText: "Enter Video Title",
              controller: fileService.titleController,
            ),
            const SizedBox(height: 8.0),
            CustomTextField(
              maxLength: 5000,
              maxLines: 5,
              hintText: "Enter Video Description",
              controller: fileService.descController,
            ),
            const SizedBox(height: 8.0),
            CustomTextField(
              maxLength: 300,
              maxLines: 3,
              hintText: "Enter Video Tags",
              controller: fileService.tagsController,
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                _mainButton(() => null, "Save File"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton _mainButton(Function()? onPressed, String text) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }

  IconButton _actionButton(Function()? onPressed, IconData icon) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon),
    );
  }
}
