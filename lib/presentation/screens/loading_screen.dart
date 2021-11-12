import 'package:flutter/material.dart';
import 'package:test_app/application/auth/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/application/user/user_bloc.dart';
import 'package:test_app/domain/user/user.dart';
import 'package:test_app/presentation/core/helper.dart';
import 'package:test_app/presentation/core/screens.dart';
import 'package:test_app/presentation/screens/home_screen.dart';
import 'package:test_app/presentation/screens/login_screen.dart';
import 'package:test_app/presentation/widgets/all_widgets.dart';
import 'package:test_app/presentation/widgets/loading_widget.dart';

class LoadingScreen extends StatefulWidget{
  _loadingScreenState createState()=>_loadingScreenState();
}
class _loadingScreenState extends State<LoadingScreen>{

  late AuthBloc authBloc;
  late UserBloc userBloc;

  void initState(){
    super.initState();
    authBloc = context.read<AuthBloc>();
    userBloc = context.read<UserBloc>();
    userBloc.add(GetLoggedInUserEvent());
  }

  Widget build(BuildContext context){

    return  SafeArea(
      child: Material(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              BlocConsumer<UserBloc,UserState>(
                builder: (context, state){
                  if(state is GetLoggedInUserState){
                    String message = 'Hold on';
                    return LoadingWidget(message: message,);
                  }

                  return Container();
                },

                listener: (context, state)async{
                  if(state is GetLoggedInUserStateComplete){
                   // print('${state.result.userMessage}');
                    if(state.result.value==null){
                      if(state.result.userMessage!=null){
                        Helper.showSnackBar(context, state.result.userMessage!,error: true);
                      }
                      ///user not logged in
                      Helper.navigate(context, Screens.LOGIN,pushReplace: true);
                    }else{
                        Helper.navigate(context, Screens.HOME,pushReplace: true);
                    }
                  }
                },
              )
            ],
          ),
      ),
    );
  }
}