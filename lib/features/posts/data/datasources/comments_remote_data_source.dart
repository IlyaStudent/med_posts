import 'package:dio/dio.dart';
import 'package:med_posts/features/posts/data/models/comment.dart';

import 'package:retrofit/http.dart';

part 'comments_remote_data_source.g.dart';

@RestApi(baseUrl: "https://json.medrocket.ru")
abstract class CommentsRemoteDataSource {
  factory CommentsRemoteDataSource(Dio dio, {String baseUrl}) =
      _CommentsRemoteDataSource;

  @GET("/comments")
  Future<List<Comment>> getComments();
}
