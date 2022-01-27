
// ignore_for_file: prefer_const_constructors
import 'package:advanced/persentation/resource/ThemData.dart';
import 'package:advanced/persentation/resource/route_manger.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
 // const MyApp({Key? key}) : super(key: key);

  int appNumber=0;
  String Ahmed="";
  MyApp._internal();
  static final MyApp insetance=MyApp._internal();

  factory MyApp()=> insetance;


  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: routeManger.splashRoute,
      theme: GetThemdata(),
    );
  }
}
