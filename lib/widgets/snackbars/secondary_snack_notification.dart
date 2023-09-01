import 'package:flutter/material.dart';

void secondarySnackNotification(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
      ),
      backgroundColor: Colors.grey,
    ),
  );
}