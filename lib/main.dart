import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_2/task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.grey.shade700,
            statusBarIconBrightness: Brightness.light,
          ),
        ),
      ),
      home: const FlutterMap(),
    );
  }
}
