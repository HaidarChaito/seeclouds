import 'package:flutter/material.dart';
import 'package:seeclouds/screens/loading_screen.dart';
import 'package:flutter/services.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      home: const LoadingScreen(),
      theme: ThemeData(fontFamily: 'IndieFlower'),
    );
  }
}

void main() => runApp(const MyApp());
