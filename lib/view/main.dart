import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:reast/view/cat_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CatPageWithModel(),
    );
  }
}
