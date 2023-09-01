import 'package:flutter/material.dart';

void primarySnackNotification(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(
            message,
          ),
        backgroundColor: Colors.green,
      ),
  );
}