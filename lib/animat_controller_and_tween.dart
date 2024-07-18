import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>with TickerProviderStateMixin {
  AnimationController? mController,m2Controller;
  Animation<double>? douController;
  Animation<Color?>? colorController;
  Animation<Size?>? sizeController;
  Animation<double>? borderController;
  @override
  void initState() {
    super.initState();
    mController=AnimationController(vsync: this,duration: Duration(seconds: 2),);
    m2Controller=AnimationController(vsync: this,duration: Duration(seconds: 2),)
      ..addListener(() {
      print(m2Controller!.value);
    /*  if(m2Controller!.value>=0.5){
        mController!.forward();
      }*/
      setState(() {

      });
    })..addStatusListener((status) {
      if(status==AnimationStatus.completed){
        print(status);
        mController!.forward();
      }
    });




    douController=Tween<double>(begin: 200,end: 200).animate(mController!);
    borderController=Tween<double>(begin: 10,end: 40).animate(mController!);
    colorController=ColorTween(begin: Colors.red,end:Colors.blue).animate(mController!);
    //sizeController=SizeTween(begin: Size(200,100),end:Size(100, 200)).animate(CurvedAnimation(parent: m2Controller!, curve: Curves.bounceInOut));
    sizeController=SizeTween(begin: Size(200,100),end:Size(100, 200)).animate(m2Controller!);
    mController!.addListener(() {
      print(sizeController!.value);
      setState(() {

      });
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: sizeController!.value!.height,
              width: sizeController!.value!.width,
              decoration: BoxDecoration(
                color: colorController!.value,
                 borderRadius: BorderRadius.circular(borderController!.value),
              ),
            ),
            ElevatedButton(onPressed: (){
              m2Controller!.forward();
            }, child: Text('Start')),
          ],
        ),
      ),
    );
  }
}
