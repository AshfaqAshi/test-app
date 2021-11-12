import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/domain/feed/feed_item.dart';
import 'package:test_app/presentation/core/constants.dart';
import 'package:test_app/presentation/widgets/all_widgets.dart';

class FeedItemWidget extends StatelessWidget{
  final FeedItem item;
  FeedItemWidget(this.item);

  Widget build(BuildContext context){
    return Padding(padding: EdgeInsets.all(Constants.FEED_ITEM_PADDING),
    child: Column(
      children: [
        Text(this.item.title,style: Theme.of(context).textTheme.headline6!
          .copyWith(fontWeight: FontWeight.bold),),
        VerticalSpace(),
        Expanded(
          child: Text(this.item.content,
          style: Theme.of(context).textTheme.headline6,),
        ),
        VerticalSpace(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            timeWidget(context),
            button(),
            shareWidget(context)
          ],
        )
      ],
    ),);
  }

  Widget timeWidget(BuildContext context){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.access_time),
        HorizontalSpace(width: 8,),
        Text('Today',style: Theme.of(context).textTheme.caption,)
      ],
    );
  }

  Widget button(){
    return TextButton(
      onPressed: (){

      },
      child: Text('CHECK IT OUT'),
    );
  }

  Widget shareWidget(BuildContext context){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
          onPressed: (){

          },
          child: Text('Share'),
        ),
        Icon(CupertinoIcons.share),
      ],
    );
  }
}