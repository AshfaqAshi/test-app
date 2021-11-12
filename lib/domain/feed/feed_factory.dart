
import 'package:test_app/domain/core/result.dart';
import 'package:test_app/domain/feed/feed_item.dart';
import 'package:test_app/domain/feed/feed_repo_base.dart';
import 'package:test_app/infrastructure/feed/feed_repository.dart';

class FeedFactory implements FeedRepoBase{

  FeedFactory._();

  static FeedFactory get instance {
    if(_instance==null) _instance = FeedFactory._();
    return _instance!;
  }

  static FeedFactory? _instance;

  FeedRepository repo = FeedRepository() ;

  List<FeedItem> _feeds=[];

  List<FeedItem> get feeds=>_feeds;

  @override
  Future<Result<List<FeedItem>>> getFeeds()async {
    var result  = await repo.getFeeds();
    if(result.success){
      _feeds = List.from(result.value!);
    }
    return result;
  }

}