
import 'package:test_app/domain/core/result.dart';
import 'package:test_app/domain/feed/feed_item.dart';
import 'package:test_app/domain/feed/feed_repo_base.dart';

class FeedRepository implements FeedRepoBase{
  
  /// Mock data
  List<FeedItem> items = [
    FeedItem(title: 'Boeing 737 Max cleared to fly by the Federal Aviation Authority', content: ''
        'consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore '
        'et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation'
        ' ullamco laboris nisi ut aliquip ex ea commodo consequat. Sed ut perspiciatis, unde omnis '
        'iste natus error sit voluptatem accusantium doloremque',
    imageName: 'airport.jpg'),

    FeedItem(title: 'This vegan cheese claims to taste like real cheese', content: ''
        'consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore '
        'et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation'
        ' ullamco laboris nisi ut aliquip ex ea commodo consequat. Sed ut perspiciatis, unde omnis iste '
        'natus error sit voluptatem accusantium doloremque',imageName: 'tom_and_jerry.gif'),

    FeedItem(title: '1 in 4 delivery workers say they have tried your food', content: ''
        'consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore '
        'et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation'
        ' ullamco laboris nisi ut aliquip ex ea commodo consequat.Sed ut perspiciatis, unde omnis iste natus error '
        'sit voluptatem accusantium doloremque',
        imageName: 'pizza.jpg'),
  ];
  @override
  Future<Result<List<FeedItem>>> getFeeds()async {
    //return mock data
    return Result(items);
  }
  
}