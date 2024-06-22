import 'dart:convert';

import 'package:flutter_advance/model/post_model.dart';
import 'package:http/http.dart';

class Network {
  static const BASE_API = "jsonplaceholder.typicode.com";

  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };

  /* HTTP APIS */
  static String API_LIST = '/posts';
  static String API_CREATE = '/posts';
  static String API_UPDATE = "/posts/"; //{id}
  static String API_DELETE = '/posts/'; //{id}
/*
   HTTP REQUEST */

  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE_API, api);
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE_API, api);
    var response = await post(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE_API, api);
    var response = await put(uri, headers: headers, body: jsonEncode(params));
  }

  static Future<String?> DEL(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE_API, api);
    var response = await delete(uri, headers: headers);
  }

  static Map<String, String> paramsEmpty() {
    Map<String, String> map = {};
    return map;
  }

  static Map<String, String> paramsCreate(Post post) {
    Map<String, String> map = {};
    map.addAll({
      'userId': post.userId.toString(),
      'title': post.title,
      'body': post.body
    });
    return map;
  }

  static Map<String, String> paramsUpdate(Post post) {
    Map<String, String> map = {};
    map.addAll({
      'id': post.id.toString(),
      'title': post.title,
      'body': post.body,
      'userId': post.userId.toString()
    });
    return map;
  }

  /* HTTP RESPONSE */
  static List<Post> getResponseList(String response) {
    dynamic json = jsonDecode(response);
    var data = List<Post>.from(json.map((x) => Post.fromJson(x)));
    return data;
  }
}
