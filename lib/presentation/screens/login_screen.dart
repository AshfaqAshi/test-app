import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/application/auth/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/domain/user/user.dart';
import 'package:test_app/presentation/core/app_theme.dart';
import 'package:test_app/presentation/core/constants.dart';
import 'package:test_app/presentation/core/helper.dart';
import 'package:test_app/presentation/core/screens.dart';
import 'package:test_app/presentation/widgets/all_widgets.dart';
import 'package:test_app/presentation/widgets/login_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:test_app/presentation/widgets/image_box.dart';

class LoginScreen extends StatefulWidget{
  _loginScreenState createState()=>_loginScreenState();
}

class _loginScreenState extends State<LoginScreen>{
  TextEditingController txtType = TextEditingController();

  late AuthBloc authBloc;

  int _currentBgIndex=0;

  _changeBgIndex(int newIndex){
    setState(() {
      _currentBgIndex = newIndex;
    });
  }

  void initState(){
    super.initState();
    authBloc = context.read<AuthBloc>();
  }
  Widget build(BuildContext context){
    return Scaffold(
      body:   Stack(
              children: [
                LoginBgWidget(Helper.loginPageBgAssets[_currentBgIndex]),
 Padding(
                        padding: const EdgeInsets.all(Constants.PADDING),
                        child: Column(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CarouselSlider(
                                        items:Helper.loginPageBgAssets.map((item){
                                          return Builder(
                                            builder: (context){
                                              return ImageBox(_currentBgIndex);
                                            },
                                          );
                                        }).toList() ,
                                        options: CarouselOptions(
                                          viewportFraction: 1.0,
                                          height: 350,
                                            enableInfiniteScroll: false,
                                            initialPage: 0,
                                            autoPlay: false,
                                            onPageChanged: (index,reason){
                                              //change to previous or next image accordingly
                                              if(index>_currentBgIndex){
                                                //next image
                                                _changeBgIndex(_currentBgIndex+1);
                                              }else{
                                                //previous image
                                                _changeBgIndex(_currentBgIndex-1);
                                              }
                                            }
                                        )),
                                    //Indicator
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: Helper.loginPageBgAssets.map((item){
                                          int index = Helper.loginPageBgAssets.indexOf(item);
                                          return Container(
                                            width: 8.0,
                                            height: 8.0,
                                            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: _currentBgIndex == index
                                                  ? Color.fromRGBO(0, 0, 0, 0.9)
                                                  : Color.fromRGBO(0, 0, 0, 0.4),
                                            ),
                                          );
                                        }).toList()
                                    )
                                  ],
                                )
                            ),
                                     BlocConsumer<AuthBloc,AuthState>(
                                       builder: (context, state){
                                         if(state is AuthenticateState){
                                           return LoadingWidget();
                                         }

                                         return Column(
                                           mainAxisSize: MainAxisSize.min,
                                           children: [
                                             LoginButton('Sign in with Google',
                                               icon: Image.asset('assets/images/google_icon.png',fit: BoxFit.contain,),
                                               onClick: (){
                                                 authBloc.add(AuthenticateEvent(txtType.text));

                                               },),
                                             VerticalSpace(),
                                             LoginButton('Sign in with Apple',
                                               icon: Image.asset('assets/images/apple_icon.png',fit: BoxFit.contain,),
                                               onClick: (){
                                                Helper.showSnackBar(context, 'This feature currently not available',error: true);

                                               },)
                                           ],
                                         );
                                       },

                                       listener: (context, state){
                                         if(state is AuthCompleteState){
                                           if(!state.result.success){
                                             Helper.showSnackBar(context, state.result.userMessage!,error: true);
                                           }else{
                                               Helper.navigate(context, Screens.HOME,pushReplace: true);
                                           }
                                         }
                                       },
                                     ),

                            VerticalSpace(),
                            SafeArea(
                            child: signUpText(),)

                          ],
                          ),
                      ),
              ],
            )
    );
  }

  Widget signUpText(){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Don\'t have an account?',style: Theme.of(context).textTheme.caption,),
          HorizontalSpace(),
          Text('Sign Up',style: Theme.of(context).textTheme.bodyText2,)
        ],
      );
  }
}