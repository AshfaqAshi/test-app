import 'package:test_app/domain/core/result.dart';
import 'package:test_app/domain/user/user.dart';

abstract class UserRepositoryBase{
  Future<Result<User>> createNewUser(User user);
  Future<Result<User>> getUser(String uid);
}