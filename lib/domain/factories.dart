
import 'package:test_app/domain/auth/auth_factory.dart';
import 'package:test_app/domain/feed/feed_factory.dart';
import 'package:test_app/domain/user/user_factory.dart';


class Factories{
  static AuthFactory authFactory = AuthFactory.instance;
  static UserFactory userFactory = UserFactory.instance;
  static FeedFactory feedFactory = FeedFactory.instance;
}