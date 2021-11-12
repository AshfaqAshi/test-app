import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_app/domain/core/result.dart';
import 'package:test_app/domain/factories.dart';
import 'package:test_app/domain/feed/feed_factory.dart';
import 'package:test_app/domain/feed/feed_item.dart';

part 'feed_event.dart';
part 'feed_state.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  FeedBloc() : super(FeedInitial()) ;

  FeedFactory feedFactory = Factories.feedFactory;

  List<FeedItem> get feeds=>feedFactory.feeds;

  Stream<FeedState> mapEventToState(FeedEvent event)async*{
    if(event is GetFeedsEvent){
      yield GetFeedsState();
      var result = await feedFactory.getFeeds();
      yield GetFeedsCompleteState(result);
    }
  }
}
