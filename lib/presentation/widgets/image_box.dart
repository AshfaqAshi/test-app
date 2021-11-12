import 'package:flutter/material.dart';
import 'package:test_app/presentation/core/helper.dart';
import 'package:test_app/presentation/widgets/all_widgets.dart';

class ImageBox extends StatelessWidget {
  final int index;
  ImageBox(this.index);

  @override
  Widget build(BuildContext context) {
    Map<String,dynamic> item = Helper.loginPageBgAssets[index];
    return  Column(
      children: [
        SizedBox(
            width: 200,
            height: 200,
            child: Image.asset(item['image'],fit: BoxFit.contain,),
          ),
        VerticalSpace(height: 20,),
        Text(item['title'],style: Theme.of(context).textTheme.headline4,textAlign: TextAlign.center),
        VerticalSpace(),
        Text(item['content'], textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodyText1,)
      ],
    );
  }
}
