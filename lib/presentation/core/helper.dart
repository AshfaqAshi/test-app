
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/domain/user/user.dart';
import 'package:test_app/presentation/core/screens.dart';
import 'package:test_app/presentation/screens/home_screen.dart';
import 'package:test_app/presentation/screens/loading_screen.dart';
import 'package:test_app/presentation/screens/login_screen.dart';
import 'package:intl/intl.dart';

class Helper{

  static Map<String, Widget Function(BuildContext context)> namedRoutes={
    Screens.HOME: (_)=>HomeScreen(),
    Screens.LOADING: (_)=>LoadingScreen(),
    Screens.LOGIN:(_)=>LoginScreen(),
  };

  static List<Map<String,dynamic>> loginPageBgAssets=[
    {'image':'assets/images/image_1.png', 'colors':[Color(0xfffaf0cb),Color(0xffebd0c7)],
    'title':'Lorem Ipsum', 'content':'Lorem ipsum dolor sit amet, consectetur adipiscing elit'},

    {'image':'assets/images/image_2.png', 'colors':[Color(0xffbfd6c6),Color(0xffded1c2)],
    'title':'dolor sit amet', 'content':'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'},

    {'image':'assets/images/image_3.png', 'colors':[Color(0xffB6BEDA),Color(0xffddcfc1)],
    'title':'consectetur', 'content':'quis nostrud exercitation ullamco laboris nisi ut aliquip ex'}
  ];


  static void navigate(BuildContext context,String name,{bool pushReplace=false, Object? arguments}){
    if(pushReplace){
      Navigator.of(context).pushReplacementNamed(name);
    }else{
      Navigator.of(context).pushNamed(name, arguments: arguments);
    }

  }

  static void showSnackBar(BuildContext context, String text,{String? actionText, VoidCallback? onAction,
  bool error=false}){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: error?Color(0xff9E1515):null,
      content: Text(text,style: error?Theme.of(context).textTheme.bodyText2
        !.copyWith(color: Colors.white):null,),
      action: actionText!=null?SnackBarAction(label: actionText, onPressed: onAction! ):null,
    ));
  }


}