part of 'feed_bloc.dart';

@immutable
abstract class FeedState {}

class FeedInitial extends FeedState {}

class GetFeedsState extends FeedState{}

class GetFeedsCompleteState extends FeedState{
  final Result<List<FeedItem>> result;
  GetFeedsCompleteState(this.result);
}
