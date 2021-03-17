import 'package:http/http.dart'as http;
import 'posts.dart';

class JsonServices{

  static Future<List<Post>> getPosts() async{
    final Uri url = Uri.parse('https://jsonplaceholder.typicode.com/photos');
    try{
      final response = await http.get(url);
      if(200 == response.statusCode){
        final List<Post> posts = postsFromJson(response.body);
        return posts;
      } else {
        return <Post>[];
      }
    }catch(e){
      return <Post>[];
    }
  }

}