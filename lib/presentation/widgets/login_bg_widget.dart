import 'package:flutter/material.dart';
import 'package:test_app/presentation/core/app_theme.dart';
import 'package:test_app/presentation/core/constants.dart';

class LoginBgWidget extends StatefulWidget {
  Map<String,dynamic> item;
  LoginBgWidget(this.item);

  @override
  _LoginBgWidgetState createState() => _LoginBgWidgetState();
}

class _LoginBgWidgetState extends State<LoginBgWidget> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: Constants.ANIMATION_DURATION),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: widget.item['colors'],
          )
      ),

      child: Container(),
    );
  }
}
