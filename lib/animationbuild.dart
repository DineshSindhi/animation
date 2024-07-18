import 'dart:math';

import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> with SingleTickerProviderStateMixin{
  AnimationController? mController;
  Animation<double>? douController;
  Animation<double>? borController;
  Animation<Color?>? colorController;
  @override
  void initState() {
    super.initState();
    mController=AnimationController(vsync: this,duration: Duration(seconds: 5));
    douController=Tween<double>(begin: 0,end: 10).animate(mController!);

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
        backgroundColor: Colors.blue,
      ),
      body: Container(width: double.infinity,
        height: double.infinity,
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: mController!,
              child: Container(
                    height: 100,
                    width: 100,
                color: Colors.blue,
              ),
              builder: (context,child){
                return Transform(
                transform: Matrix4.skew(douController!.value, douController!.value),
                child: child!,);
              },
              ),
            ElevatedButton(onPressed: (){
              mController!.repeat(reverse: true);
            }, child: Text('Start'))
          ],
        ),
      ),
    );
  }
}
