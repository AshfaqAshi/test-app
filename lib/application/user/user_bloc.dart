import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_app/domain/auth/auth_factory.dart';
import 'package:test_app/domain/core/result.dart';
import 'package:test_app/domain/user/user.dart';
import 'package:test_app/domain/user/user_factory.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial());

  AuthFactory authFactory = AuthFactory.instance;
  UserFactory userFactory = UserFactory.instance;

  User? get loggedInUser=>userFactory.loggedInUser;

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if(event is GetLoggedInUserEvent){
      yield GetLoggedInUserState();
      Result<User> result=await authFactory.getLoggedInUser();
      yield GetLoggedInUserStateComplete(result);
    }else if(event is GetUserEvent){
      yield GetUserState();
      Result<User> result=await userFactory.getUser(event.uid);
      yield GetUserStateComplete(result);
    }else if(event is LogOutEvent){
      yield LogOutState();
      Result<bool> result=await authFactory.logOutUser();
      yield LogOutCompleteState(result);
    }
  }
  void setLoggedInUser(User user){
    userFactory.setLoggedInUser(user);
  }

}
