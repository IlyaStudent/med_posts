import 'package:dio/dio.dart';
import 'package:med_posts/features/posts/data/models/user.dart';
import 'package:retrofit/http.dart';

part 'users_remote_data_source.g.dart';

@RestApi(baseUrl: "https://json.medrocket.ru")
abstract class UsersRemoteDataSource {
  factory UsersRemoteDataSource(Dio dio, {String baseUrl}) =
      _UsersRemoteDataSource;

  @GET("/users/")
  Future<List<User>> getUsersById(@Query('id') int id);
}
