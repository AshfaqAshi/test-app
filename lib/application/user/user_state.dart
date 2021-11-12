part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class GetLoggedInUserState extends UserState{}

class GetLoggedInUserStateComplete extends UserState{
  final Result<User> result;
  GetLoggedInUserStateComplete(this.result);
}

class GetUserStateComplete extends UserState{
  final Result<User> result;
  GetUserStateComplete(this.result);
}

class GetUserState extends UserState{}

class LogOutState extends UserState{}

class LogOutCompleteState extends UserState{
  final Result<bool> result;
  LogOutCompleteState(this.result);
}