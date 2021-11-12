import 'package:flutter/material.dart';

class FadeInWidget extends StatefulWidget {
final FadeController controller;
final String initialImage;
FadeInWidget({required this.controller, required this.initialImage});

  @override
  _FadeInWidgetState createState() => _FadeInWidgetState();
}

class _FadeInWidgetState extends State<FadeInWidget> with TickerProviderStateMixin{

  late Animation<double> fadeInAnimation,fadeOutAnimation;
  late AnimationController fadeInController,fadeOutController;

  String? oldImage, newImage;

  void initState(){
    super.initState();
    widget.controller.change=_onChange;

    fadeInController = AnimationController(vsync: this,
    duration: Duration(milliseconds: 800));

    fadeOutController =  AnimationController(vsync: this,
        duration: Duration(milliseconds: 800));

    fadeInAnimation = Tween<double>(begin: 0.0,end: 1.0).animate(
      CurvedAnimation(parent: fadeInController, curve: Curves.easeIn)
    );

    fadeOutAnimation = Tween<double>(begin: 1.0,end: 0.0).animate(
        CurvedAnimation(parent: fadeOutController, curve: Curves.easeOut)
    );

    fadeInController.forward();
  }

  _onChange(String image){
    setState(() {
      if(oldImage==null){
        //this is the first change
        oldImage=widget.initialImage;
      }else{
        oldImage=newImage;
      }
      newImage = image;
    });
    fadeInController.reset();
    fadeOutController.reset();
    fadeOutController.forward();
    fadeInController.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if(oldImage!=null)
          imageBox(oldImage!, fadeOutAnimation),
        imageBox(newImage==null?widget.initialImage:newImage!, fadeInAnimation)
      ],
    );
  }

  Widget imageBox(String image,Animation<double> animation){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.6,
      child: FadeTransition(
        opacity: animation,
        child: Image.asset('assets/images/$image',fit: BoxFit.cover,),
      ),
    );
  }
}

class FadeController{
  Function(String)? change;
}
