
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

void main() => runApp(GetMaterialApp(home: Myhomepage()));

class sound extends GetxController{
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache();
  initialise(){
    audioPlayer = AudioPlayer();
    audioCache=AudioCache(fixedPlayer: audioPlayer);

  }
  playaudio(){
    audioPlayer!.stop();
    audioCache.play('song1.mp3');
  }
  stopaudio(){
    audioPlayer!.stop();
  }
  dispose(){
    audioPlayer!.dispose();
    super.dispose();
  }
}

class Myhomepage extends StatelessWidget {

  Myhomepage({Key? key}) : super(key: key);

  final controller = Get.put(sound());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children:[
            RaisedButton(
            child:Text("play") ,
            onPressed: (){
              controller.initialise();
              controller.playaudio();
            },
            ),
                  RaisedButton(
                    child:Text("pause") ,
                    onPressed: (){
                      controller.stopaudio();
                    },
                  ),
                ],
            ),
          ),
    );
  }
}