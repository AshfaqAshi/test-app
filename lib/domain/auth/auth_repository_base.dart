import 'package:test_app/domain/core/result.dart';
import 'package:test_app/domain/user/user.dart';

abstract class AuthRepositoryBase{
  Future<Result<User>> signInUser();
  Future<Result<bool>> logOutUser();
  Future<Result<User>> getLoggedInUser();
}