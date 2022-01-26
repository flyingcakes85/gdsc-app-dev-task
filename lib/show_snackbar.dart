import 'package:flutter/material.dart';

void showSnackbar(BuildContext context, String text, IconData icon) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          Text(text)
        ],
      ),
    ),
  );
}
