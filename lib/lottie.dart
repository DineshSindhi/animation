import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> with SingleTickerProviderStateMixin {
  AnimationController? mController;
  @override
  void initState() {
    super.initState();
    mController=AnimationController(vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text('Lottie Animation'),
      backgroundColor: Colors.blue,
    ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/lottie/no data.json',width: 200,height: 200,
            controller: mController,
              onLoaded: (Lottie){
                mController!.duration=Lottie.duration;
              }

            ),
            ElevatedButton(onPressed: (){
              mController!.forward();
            }, child: Text('Star'))
          ],
        ),
      ),

    );
  }
}
