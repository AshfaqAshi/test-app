
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_app/domain/core/result.dart';
import 'package:test_app/domain/user/user.dart';
import 'package:test_app/domain/user/user_factory.dart';
import 'package:test_app/domain/user/user_repository_base.dart';

class UserRepository implements UserRepositoryBase{
  
  CollectionReference<User> _getUserCollection(){
    return FirebaseFirestore.instance.
    collection(Collection.USERS).
        withConverter<User>(fromFirestore: (snap,options)=>User.fromMap(snap), toFirestore: (user,options)=>user.toMap());
  }

  DocumentReference<User> _getUserDoc(String id){
    return FirebaseFirestore.instance.
    collection(Collection.USERS).
    withConverter<User>(fromFirestore: (snap,options)=>User.fromMap(snap), toFirestore: (user,options)=>user.toMap())
    .doc(id);
  }

  @override
  Future<Result<User>> createNewUser(User user)async{
    try{
        await _getUserCollection().doc(user.uid).set(user);
      return Result(user,);
    }catch(ex){
      return Result(null,success: false,userMessage: 'Failed to create or update user', message: ex.toString());
    }
  }

  @override
  Future<Result<User>> getUser(String uid)async{
    try{
      Completer<Result<User>> completer = Completer();
      DocumentSnapshot<User> userSnap = await _getUserDoc(uid).get();
      if(userSnap.exists){
        ///user exists!
        User user = userSnap.data()!;
        return Result(user);

      }else{
        ///this user does not exist! oops!
        return Result(null,errorCode: ErrorCodes.NO_USER, success: false, userMessage: 'This user does not exist!');
      }
    }catch(ex,stack){
      print('error ${ex.toString()}');
      print('stack ${stack.toString()}');
      return Result(null,success: false,userMessage: 'An error occurred while getting user', message: ex.toString());
    }
  }

}

class Collection{
  static const String USERS='users';
}


