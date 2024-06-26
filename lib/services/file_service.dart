import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/snackbar_utils.dart';

class FileService {
  // Title Controller
  final TextEditingController titleController = TextEditingController();

  // Description Controller
  final TextEditingController descController = TextEditingController();

  // Tags Controller
  final TextEditingController tagsController = TextEditingController();

  bool fieldsNotEmpty = false;

  File? _selectedFile;
  String _selectedDir = "";

  void saveContent(context) async {
    final title = titleController.text;
    final desc = descController.text;
    final tags = tagsController.text;

    final textContent =
        "Title:\n\n$title\n\nDescription:\n\n$desc\n\nTags:\n\n$tags";

    try {
      if (_selectedFile != null) {
        await _selectedFile!.writeAsString(textContent);
        SnackBarUtils.showSnackbar(context, Icons.check_circle,
            "File saved at ${_selectedFile!.path}");
      } else {
        final todayDate = getTodayDate();
        String metadataDirPath = _selectedDir;
        if (metadataDirPath.isEmpty) {
          final dir = await FilePicker.platform.getDirectoryPath();
          _selectedDir = metadataDirPath = dir!;
        }
        final filePath = '$metadataDirPath/$todayDate-$title-Metadata.txt';
        final newFile = File(filePath);
        await newFile.writeAsString(textContent);
        SnackBarUtils.showSnackbar(
            context, Icons.check_circle, "File saved at ${newFile.path}");
      }
    } catch (e) {
      log(e.toString());
      SnackBarUtils.showSnackbar(context, Icons.error, "File not saved!");
    }
  }

  void loadFile(context) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        File file = File(result.files.single.path!);
        _selectedFile = file;

        final fileContent = await file.readAsString();

        final lines = fileContent.split("\n\n");
        titleController.text = lines[1];
        descController.text = lines[3];
        tagsController.text = lines[5];

        SnackBarUtils.showSnackbar(
          context,
          Icons.upload_file,
          "File Uploaded!",
        );
      } else {
        SnackBarUtils.showSnackbar(context, Icons.error, "No File Selected!");
      }
    } catch (e) {
      SnackBarUtils.showSnackbar(context, Icons.error, "No file selected!");
    }
  }

  void newFile(context) {
    _selectedFile = null;
    titleController.clear();
    descController.clear();
    tagsController.clear();
    SnackBarUtils.showSnackbar(context, Icons.file_open, "New File Created!");
  }

  void newDir(context) async {
    try {
      String? dir = await FilePicker.platform.getDirectoryPath();
      _selectedDir = dir!;
      _selectedFile = null;
      SnackBarUtils.showSnackbar(
        context,
        Icons.folder_open,
        "New folder selected at $dir",
      );
    } catch (e) {
      SnackBarUtils.showSnackbar(
        context,
        Icons.error_rounded,
        "No Folder Selected!",
      );
    }
  }

  static String getTodayDate() {
    final now = DateTime.now();
    final formatter = DateFormat("yyyy-MM-dd");
    final formattedDate = formatter.format(now);
    return formattedDate;
  }
}
