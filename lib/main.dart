import 'package:animat/animat_controller_and_tween.dart';
import 'package:animat/animationbuild.dart';
import 'package:animat/lottie.dart';
import 'package:animat/rive%20animation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: RivePage(),
    );
  }
}

