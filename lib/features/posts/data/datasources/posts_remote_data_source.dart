import 'package:dio/dio.dart';
import 'package:med_posts/features/posts/data/models/post.dart';
import 'package:retrofit/http.dart';

part 'posts_remote_data_source.g.dart';

@RestApi(baseUrl: "https://json.medrocket.ru")
abstract class PostsRemoteDataSource {
  factory PostsRemoteDataSource(Dio dio, {String baseUrl}) =
      _PostsRemoteDataSource;

  @GET("/posts")
  Future<List<Post>> getPosts();
}
