import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_advance/model/post_model.dart';

class RtdbService {
  static final _database = FirebaseDatabase.instance.ref();

  static Future<Stream<DatabaseEvent>> addPost(Post post) async {
    _database.child("posts").push().set(post.toJson());
    print("TITLE DATABSE:${post.title}");
    return _database.onChildAdded;
  }

  static Future<List<Post>> getPosts() async {
    List<Post> items = [];
    Query _query = _database.ref.child("posts");
    DatabaseEvent event = await _query.once();
    var snapshot = event.snapshot;

    for (var child in snapshot.children) {
      var jsonPost = jsonEncode(child.value);
      Map<String, dynamic> map = jsonDecode(jsonPost);
      var post =
          Post(title: map['title'], body: map['body'], userId: map['userId']);
      items.add(post);
    }
    return items;
  }

  static Future<void> deletePost() async {
    _database.child('posts').remove();
  }
}
