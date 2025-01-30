import 'package:flutter/material.dart';
import 'package:my_project/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart'; 

void main() async {
  // Initialize Hive
  await Hive.initFlutter();
  await Hive.openBox('mybox'); // Open Hive box

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.green ),
    );
  }
}
