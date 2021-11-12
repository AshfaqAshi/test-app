import 'package:flutter/material.dart';
import 'package:test_app/presentation/core/app_theme.dart';
import 'package:test_app/presentation/core/constants.dart';

class LoginButton extends StatelessWidget{
  final VoidCallback onClick;
  final String text;
  final Widget? icon;
  LoginButton(this.text,{required this.onClick,this.icon});
  Widget build(BuildContext context){
      return TextButton(
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all<Size>(
            Size.fromWidth(300)
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.all(Constants.BUTTON_PADDING)
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            AppTheme.colors.loginButtonColor
          ),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Constants.BUTTON_BORDER_RADIUS)
            )
          )
        ),
          onPressed: onClick, child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 25,
            height: 25,
            child: icon!,
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Center(child: Text(text),),
          )
        ],
      ));
  }
}