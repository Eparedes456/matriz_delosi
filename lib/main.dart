import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matriz_delosi/pages/matriz/matriz_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rotación de matriz',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: MatrizPage()
    );
  }
}

