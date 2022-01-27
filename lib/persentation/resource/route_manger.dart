// ignore: camel_case_types


// ignore_for_file: prefer_const_constructors

import 'package:advanced/persentation/border/border.dart';
import 'package:advanced/persentation/forgotpassword/forgotpassword.dart';
import 'package:advanced/persentation/login/login.dart';
import 'package:advanced/persentation/login/loginviewmodal.dart';
import 'package:advanced/persentation/main/mainAppp.dart';
import 'package:advanced/persentation/register/register.dart';
import 'package:advanced/persentation/resource/Stringmanger.dart';
import 'package:advanced/persentation/splash/splash.dart';
import 'package:advanced/persentation/storeDetails/StoreDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class routeManger{
  static const String  splashRoute="/";
  static const String  borderRoute="/border";
  static const String  loginRoute="/login";
  static const String  registerRoute="/register";
  static const String  forgotpasswordRoute="/forgotpassword";
  static const String  mainRoute="/main";
  static const String  storeDetailsRoute="/storeDetails";
}


/*class RouteGenerate{
  static Route<dynamic> getRoute (RouteSettings routeSettings){
    switch(routeSettings.name){
      case routeManger.splashRoute:
      return MaterialPageRoute(builder: (context)=>Splash());

      case routeManger.forgotpasswordRoute:
        return MaterialPageRoute(builder: (context)=>forgotPassword());

      case routeManger.loginRoute:
        return MaterialPageRoute(builder: (context)=>login());

      case routeManger.mainRoute:
        return MaterialPageRoute(builder: (context)=>mainAppp());

      case routeManger.registerRoute:
        return MaterialPageRoute(builder: (context)=>register());

      case routeManger.storeDetailsRoute:
        return MaterialPageRoute(builder: (context)=>Details());

      case routeManger.borderRoute:
        return MaterialPageRoute(builder: (context)=>border());
      defult:
      return unDefindRoute();
    }
  }

}*/


class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case routeManger.splashRoute:
        return MaterialPageRoute(builder: (context) => Splash());

      case routeManger.forgotpasswordRoute:
        return MaterialPageRoute(builder: (context) => forgotPassword());

      case routeManger.loginRoute:
        return MaterialPageRoute(builder: (context) => LoginView());

      case routeManger.mainRoute:
        return MaterialPageRoute(builder: (context) => mainAppp());

      case routeManger.registerRoute:
        return MaterialPageRoute(builder: (context) => register());

      case routeManger.storeDetailsRoute:
        return MaterialPageRoute(builder: (context) => Details());

      case routeManger.borderRoute:
        return MaterialPageRoute(builder: (context) => border());
      default:
        return unDefinedRoute();
    }
  }
  static Route<dynamic> unDefinedRoute(){
    return MaterialPageRoute(builder: (context)=>Scaffold(
      appBar: AppBar(title:Text(StringManger.NoRoutefound),),
      body: Center(
        child: Text(StringManger.NoRoutefound),
      ),
    ));
  }

}