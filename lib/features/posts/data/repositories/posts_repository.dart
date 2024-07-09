import 'package:dio/dio.dart';
import 'package:med_posts/features/posts/data/datasources/comments_remote_data_source.dart';
import 'package:med_posts/features/posts/data/datasources/posts_remote_data_source.dart';
import 'package:med_posts/features/posts/data/datasources/users_remote_data_source.dart';
import 'package:med_posts/features/posts/data/models/post_comment.dart';
import 'package:med_posts/features/posts/data/models/post.dart';
import 'package:med_posts/features/posts/data/models/post_full_info.dart';
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
  Future<List<Post>> _getAllPosts() async {
    final posts = await _postsRemoteDataSource.getPosts();
    posts.sort((a, b) => a.id.compareTo(b.id));
    return posts;
  }

  Future<List<User>> _getUserById(int userId) async =>
      await _usersRemoteDataSource.getUsersById(userId);

  // API и так возвращает сортированный список комментариев по айди
  // но в задании почему то был на этом акецент, поэтому внедрил сортировку
  Future<List<PostComment>> _getCommentsById(int postId) async {
    var allComments =
        await _commentsRemoteDataSource.getCommentsByPostId(postId);
    allComments.sort((a, b) => a.id.compareTo(b.id));
    return allComments;
  }

  Future<PostFullInfo> _getPostFullInfo(Post post) async {
    final user = await _getUserById(post.userId);
    final commentsList = await _getCommentsById(post.id);

    return PostFullInfo(
        post: post, user: user.first, commentsList: commentsList);
  }

  Future<List<PostFullInfo>> getAllInfoPosts() async {
    final postsList = await _getAllPosts();
    var res = Future.wait(postsList.map((e) => _getPostFullInfo(e)));
    return res;
  }
}
