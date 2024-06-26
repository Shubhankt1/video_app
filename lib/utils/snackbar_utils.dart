import 'package:flutter/material.dart';

class SnackBarUtils {
  static void showSnackbar(
      BuildContext context, IconData icon, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 8),
            Text(message),
          ],
        ),
      ),
    );
  }
}
