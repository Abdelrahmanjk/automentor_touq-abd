import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Dio dio = Dio();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: ()async{
            Map<String,dynamic> map = {
              'title' : 'Porsche 911 GT3 RS at the 0-to-150-to-0-MPH Speed Test 2023',
              'description' : "The GT3 RS wasn't the quickest car of the test, but it sure sounded like it. When the GT3 RS headed for the starting line—pausing for a launch-control start or two to warm up the tires—airport workers lined up at the fence to watch. It was always a worthy spectacle, the GT3 chattering at 6500 rpm before shrieking off the line and kissing 9000 rpm while sounding like the devil's dirt bike. Unlike the Cadillac's multifaceted, adjustable launch control, the GT3 RS's is unwilling to learn and unable to be adjusted (perhaps that's a window into differing corporate philosophies). Just easing onto the throttle without launch control was about as quick on the less grippy Oscoda surface. Despite active aerodynamics that switch to a low-downforce mode when the GT3 is pointing straight and accelerating, the Porsche was slower to 150 mph than both the GT Speed and the Blackwing—which, we know, is a ridiculous thing to point out about a car that is, after all, powered by a naturally aspirated six-cylinder.",
            'path' : 'https://hips.hearstapps.com/hmg-prod/images/porsche-911-gt3-rs-107-654e508f0dae3.jpg?crop=0.711xw:0.599xh;0.177xw,0.242xh&resize=1200:*',

            };
            var response= await dio.get('http://10.7.3.46:8080/get-data');

            print(response.data);
          },
          child: Text('Press me'),
        )
      ),
    );
  }
}
