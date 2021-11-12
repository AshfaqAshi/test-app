import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_app/domain/auth/auth_factory.dart';
import 'package:test_app/domain/core/result.dart';
import 'package:test_app/domain/user/user.dart';
import 'package:test_app/infrastructure/auth/auth_repository.dart';
import 'package:test_app/infrastructure/user/user_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
   AuthFactory authFactory = AuthFactory.instance;
  AuthBloc() : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
     if(event is AuthenticateEvent){
       yield AuthenticateState();
      // print('sending memcode ${event.memCode}');
       Result<User> result = await authFactory.signInUser();
       yield AuthCompleteState(result);
     }
  }
}
