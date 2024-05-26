import 'package:flutter/material.dart';
import 'package:newsapp/views/home.dart';
// ignore: unused_import
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

       primaryColor: Colors.white,
      ),
      home: const Home(),
    );
  }
}

