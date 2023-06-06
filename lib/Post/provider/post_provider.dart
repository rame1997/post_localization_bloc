import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../utilities/api_settings.dart';
import '../model/post.dart';


class PostProvider  {
  static Future<List<Post>> getPosts(
      [int startIndex = 0, int limit = 20]) async {
    final url = ApiSettings.GET_POST+"_start=$startIndex&_limit=$limit";
    try {
      var response = await http.get(Uri.parse(url));

      List<Post> posts = (json.decode(response.body))
          .map<Post>((jsonPost) => Post.fromJson(jsonPost))
          .toList();
      return posts;
    } catch (e) {
      rethrow;
    }
  }
}
