
import 'package:test_app/domain/core/result.dart';
import 'package:test_app/domain/feed/feed_item.dart';

abstract class FeedRepoBase{
  Future<Result<List<FeedItem>>> getFeeds();
}