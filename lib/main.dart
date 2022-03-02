import 'package:flutter/material.dart';
import 'package:task_1_mon_28th_feb22/screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'task_one_yisafa',
      theme: ThemeData(
        backgroundColor: Colors.grey,
        primarySwatch: Colors.blue,
      ),
      home: const Homepage(),
    );
  }
}
