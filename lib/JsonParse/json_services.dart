import 'package:http/http.dart'as http;
import 'posts.dart';

class JsonServices{
  static const String url = 'https://jsonplaceholder.typicode.com/photos';

  static Future<List<Post>> getPosts() async{
    try{
      final response = await http.get(url);
      if(200 == response.statusCode){
        final List<Post> posts = postsFromJson(response.body);
        return posts;
      } else {
        return List<Post>();
      }
    }catch(e){
      return List<Post>();
    }
  }

}