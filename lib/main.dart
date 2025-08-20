import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages

import 'package:text_to_image_app/AI%20Image%20Generator/image_generator.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AiTextToImageGenerator(),
    );
  }
}

      
      
