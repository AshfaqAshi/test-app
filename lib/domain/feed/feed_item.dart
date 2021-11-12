
import 'package:cloud_firestore/cloud_firestore.dart';

class FeedItem{
  String? id;
  String title;
  String content;
  String? imageName;
  Timestamp? time;
  FeedItem({required this.title, required this.content,
  this.imageName,this.time});

}