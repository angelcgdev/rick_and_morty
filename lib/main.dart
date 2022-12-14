import 'package:flutter/material.dart';
import 'package:helloworld/src/pages/home/home.dart';
import 'package:helloworld/src/styles/styles.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick and Morty',
      theme: AppTheme.ligth,
      home: const HomePage(),
    );
  }
}
