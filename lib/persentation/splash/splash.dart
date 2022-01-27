

// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:advanced/persentation/resource/Color.dart';
import 'package:advanced/persentation/resource/imageManger.dart';
import 'package:advanced/persentation/resource/route_manger.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}


class _SplashState extends State<Splash> {

  Timer?_timer;
  _StartDelay(){
    _timer=Timer(Duration(seconds: 2),_goNext);
  }
  _goNext(){
    Navigator.pushReplacementNamed(context, routeManger.borderRoute);
  }

  @override
  void dispose() {
    _timer?.cancel();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    _StartDelay();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.primary,
      body: Center(child: Image(image:AssetImage(StringImage.splash_logo) ,),),
    );
  }
}
