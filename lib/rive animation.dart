import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class RivePage extends StatefulWidget {
  const RivePage({super.key});

  @override
  State<RivePage> createState() => _RivePageState();
}

class _RivePageState extends State<RivePage> {
  StateMachineController? mController;
  Artboard? mainArtBoard;
  SMIInput<bool>? check;
  @override
  void initState() {
    super.initState();
    rootBundle.load('assets/rive/star.riv').then((riveByteData) {
      var riveFile=RiveFile.import(riveByteData);
      var mArtBoard=riveFile.mainArtboard;
      mController=StateMachineController.fromArtboard(mArtBoard, 'State Machine 1');
      if(mController!=null){
        mArtBoard.addController(mController!);
        check=mController!.findInput('check');
        mainArtBoard=mArtBoard;
        setState(() {

        });
      }


    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text('Rive Animation'),
      backgroundColor: Colors.blue,
    ),
      body: Center(
        child: SizedBox(
          height: 200,
          width: 200,
          child: mainArtBoard!=null && check!=null?InkWell(
              onTap: (){
                check!.value=!check!.value;
              },
              child: Rive(artboard: mainArtBoard!)):Container(),
        ),
      )

    );
  }
}
