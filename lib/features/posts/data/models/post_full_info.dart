import 'package:med_posts/features/posts/data/models/post.dart';
import 'package:med_posts/features/posts/data/models/post_comment.dart';
import 'package:med_posts/features/posts/data/models/user.dart';

class PostFullInfo {
  final Post post;
  final User user;
  final List<PostComment>? commentsList;
  PostFullInfo({
    required this.post,
    required this.user,
    required this.commentsList,
  });
}
