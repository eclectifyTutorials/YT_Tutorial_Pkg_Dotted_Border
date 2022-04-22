// ignore_for_file: prefer_const_constructors

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const customSwatch = MaterialColor(
    0xFFFF5252,
    <int, Color>{
      50: Color(0xFFFFEBEE),
      100: Color(0xFFFFCDD2),
      200: Color(0xFFEF9A9A),
      300: Color(0xFFE57373),
      400: Color(0xFFEF5350),
      500: Color(0xFFFF5252),
      600: Color(0xFFE53935),
      700: Color(0xFFD32F2F),
      800: Color(0xFFC62828),
      900: Color(0xFFB71C1C),
    },
  );

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: customSwatch,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Path customPath = Path()
    ..moveTo(20, 20)
    ..lineTo(50, 100)
    ..lineTo(20, 200)
    ..lineTo(100, 100)
    ..lineTo(20, 20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dotted Border"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DottedBorder(
                  borderType: BorderType.RRect,
                  strokeWidth: 5,
                  /// 6 pixel wide dash, 3 pixel wide space, 2 pixel wide dash, 3 pixel wide space, repeat
                  dashPattern: [20, 3, 2, 3],
                  radius: Radius.circular(12),
                  padding: EdgeInsets.all(6),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    child: Container(
                      height: 200,
                      width: 120,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
                SizedBox(width: 40,),
                DottedBorder(
                  customPath: (size) => customPath, // PathBuilder
                  color: Colors.black,
                  dashPattern: [8, 4],
                  strokeWidth: 2,
                  child: Container(
                    height: 220,
                    width: 120,
                    color: Colors.redAccent.withAlpha(100),
                  ),
                )
              ],
            ),
            SizedBox(height: 40,),
            DottedBorder(
              borderType: BorderType.Circle,
              strokeWidth: 5,
              /// 6 pixel wide dash, 3 pixel wide space, repeat
              //dashPattern: [6, 3,],
              radius: Radius.circular(12),
              padding: EdgeInsets.all(6),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(120)),
                child: Container(
                  height: 120,
                  width: 120,
                  color: Colors.redAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

