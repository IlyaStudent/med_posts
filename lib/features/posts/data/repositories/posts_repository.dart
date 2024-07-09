import 'package:dio/dio.dart';
import 'package:med_posts/features/posts/data/datasources/comments_remote_data_source.dart';
import 'package:med_posts/features/posts/data/datasources/posts_remote_data_source.dart';
import 'package:med_posts/features/posts/data/datasources/users_remote_data_source.dart';
import 'package:med_posts/features/posts/data/models/comment.dart';
import 'package:med_posts/features/posts/data/models/post.dart';
import 'package:med_posts/features/posts/data/models/user.dart';

class PostsRepository {
  final PostsRemoteDataSource _postsRemoteDataSource =
      PostsRemoteDataSource(Dio());
  final UsersRemoteDataSource _usersRemoteDataSource =
      UsersRemoteDataSource(Dio());
  final CommentsRemoteDataSource _commentsRemoteDataSource =
      CommentsRemoteDataSource(Dio());

  // API и так возвращает сортированный список постов по айди
  // но в задании почему то был на этом акецент, поэтому внедрил сортировку
  Future<List<Post>> getAllPosts() async {
    final posts = await _postsRemoteDataSource.getPosts();
    posts.sort((a, b) => a.id.compareTo(b.id));
    return posts;
  }

  Future<User> getUserById(int userId) async {
    final allUsers = await _usersRemoteDataSource.getUsers();
    return allUsers.where((element) => element.id == userId).toList().first;
  }

  // API и так возвращает сортированный список комментариев по айди
  // но в задании почему то был на этом акецент, поэтому внедрил сортировку
  Future<List<Comment>> getCommentsById(int postId) async {
    var allComments = await _commentsRemoteDataSource.getComments();
    allComments =
        allComments.where((element) => element.postId == postId).toList();
    allComments.sort((a, b) => a.id.compareTo(b.id));
    return allComments;
  }
}
