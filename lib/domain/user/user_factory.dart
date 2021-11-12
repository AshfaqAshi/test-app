import 'package:test_app/domain/core/result.dart';
import 'package:test_app/domain/user/user.dart';
import 'package:test_app/domain/user/user_repository_base.dart';
import 'package:test_app/infrastructure/user/user_repository.dart';

class UserFactory implements UserRepositoryBase{

  UserFactory._();
  static UserFactory? _instance;
  static UserFactory get instance{
    if(_instance == null){
      _instance = UserFactory._();
    }
    return _instance!;
  }

  UserRepository userRepo = UserRepository();

  User? _loggedInUser;

  User? get loggedInUser => _loggedInUser;

  void setLoggedInUser(User user){
    _loggedInUser = user;
  }

  @override
  Future<Result<User>> createNewUser(User user)async {
    Result<User> result = await userRepo.createNewUser(user);
    if(result.success && result.value!=null){
      _loggedInUser = result.value;
    }
    return result;
  }

  @override
  Future<Result<User>> getUser(String uid)async {
    return await userRepo.getUser(uid);
  }

}