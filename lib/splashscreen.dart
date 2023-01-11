import 'dart:async';
import 'package:flutter/material.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:the_calculator/main.dart';

class splash extends StatefulWidget {  @override
  State<StatefulWidget> createState() {
    return splashstate();
  }
}


class splashstate extends State<splash>{

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
          ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context)=>Home()
      )),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            Container(height: 250,),
            GFAvatar(
              radius: 70,
              backgroundColor: Colors.black,
              backgroundImage: NetworkImage('https://is4-ssl.mzstatic.com/image/thumb/Purple114/v4/72/72/ba/7272ba4a-ce16-0006-48a9-a21db3dc5ccd/AppIcon-1x_U007emarketing-0-7-0-85-220.jpeg/512x512bb.jpg'),
            ),
            Container(height: 280,),

            CircularProgressIndicator(color: Colors.green,)
          ],
        ),
      ),);
  }
}
