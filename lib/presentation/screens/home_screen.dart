import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:test_app/application/auth/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/application/feed/feed_bloc.dart';
import 'package:test_app/application/user/user_bloc.dart';
import 'package:test_app/domain/feed/feed_factory.dart';
import 'package:test_app/presentation/core/constants.dart';
import 'package:test_app/presentation/core/helper.dart';
import 'package:test_app/presentation/core/screens.dart';
import 'package:test_app/presentation/widgets/all_widgets.dart';
import 'package:test_app/presentation/widgets/fade_in_widget.dart';
import 'package:test_app/presentation/widgets/feed_item_widget.dart';

class HomeScreen extends StatefulWidget{
  _HomeScreenState createState()=>_HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{
  late UserBloc userBloc;
  late FeedBloc feedBloc;

  int currentIndex=0;

  FadeController fadeController = FadeController();

  List<String> titles=[];

  void initState(){
    super.initState();
    userBloc = context.read<UserBloc>();
    feedBloc = context.read<FeedBloc>();
    feedBloc.add(GetFeedsEvent());
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: BlocBuilder<FeedBloc,FeedState>(
       builder: (context, state){
         if(state is GetFeedsState){
           return LoadingWidget();
         }

         if(feedBloc.feeds.isNotEmpty){
           return Stack(
             children: [
               //Bg Widget
               bgImageWidget(),

               //List of Feeds
               SafeArea(
                 child: Align(
                   alignment: Alignment.bottomCenter,
                   child: Card(
                     elevation: Constants.CARD_ELEVATION,
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(Constants.CARD_BORDER_RADIUS)
                     ),
                     margin: EdgeInsets.all(Constants.CARD_MARGIN),
                     child:Padding(
                       padding: EdgeInsets.all(Constants.CARD_PADDING),
                       child: CarouselSlider.builder(
                           itemCount: feedBloc.feeds.length,
                           itemBuilder: (context,index,pageIndex){
                             return FeedItemWidget(feedBloc.feeds[index]);
                           },
                           options: CarouselOptions(
                             height: MediaQuery.of(context).size.height*0.45,
                               scrollDirection: Axis.vertical,
                               enableInfiniteScroll: false,
                               autoPlay: false,
                               viewportFraction: 1.0,
                               onPageChanged: (index,reason){
                                 //change the image
                                 fadeController.change!(feedBloc.feeds[index].imageName!);
                               }
                           )),
                     ) ,
                   ),
                 ),
               ),

               Positioned(
                 top: 0,
                 child: BlocListener<UserBloc,UserState>(
                   listener: (context,state){
                     if(state is LogOutCompleteState){
                       Helper.navigate(context, Screens.LOGIN,pushReplace: true);
                     }
                   },
                   child: SafeArea(
                     child: IconButton(
                       icon: Icon(Icons.logout),
                       onPressed: (){
                         userBloc.add(LogOutEvent());
                       },
                     ),
                   ),
                 ),
               )
             ],
           );
         }
         return Container();
       },
     ),
   );
  }

  Widget bgImageWidget(){
    //The background image widget
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.center,
          colors: <Color>[Colors.transparent,Colors.white],
        ).createShader(bounds);
      },
      blendMode: BlendMode.dstATop,
      child: FadeInWidget(controller: fadeController, initialImage: feedBloc.feeds[0].imageName!),
    );
  }

}