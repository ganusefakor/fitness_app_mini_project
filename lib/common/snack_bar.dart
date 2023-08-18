import 'package:flutter/material.dart';

showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: const Color(0xff18181A),
      content: Text(
        content,
        style: const TextStyle(color: Colors.white),
      ),
    ),
  );
}