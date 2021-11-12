
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String? uid;
  String? name;

  User({this.name});

  User.fromMap(DocumentSnapshot<Map<String, dynamic>> doc)
      :
        this.name=doc.data()!['name'],
        this.uid=doc.data()!['uid'];

  toMap() {
    return {
      'name': this.name,
      'uid': this.uid,
    };
  }
}

