import 'package:flutter/material.dart';

class FileService {
  // Title Controller
  final TextEditingController titleController = TextEditingController();

  // Description Controller
  final TextEditingController descController = TextEditingController();

  // Tags Controller
  final TextEditingController tagsController = TextEditingController();

  bool fieldsNotEmpty = false;
}
