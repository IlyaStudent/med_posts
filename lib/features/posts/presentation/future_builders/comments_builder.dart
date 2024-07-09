import 'package:flutter/material.dart';
import 'package:med_posts/features/posts/data/models/comment.dart';
import 'package:med_posts/features/posts/data/repositories/posts_repository.dart';
import 'package:med_posts/features/posts/presentation/widgets/comment_widget.dart';
import 'package:med_posts/features/posts/presentation/widgets/error_desc_widget.dart';
import 'package:med_posts/features/posts/presentation/widgets/loading_indicator.dart';

class CommentsBuilder extends StatefulWidget {
  final int postId;
  const CommentsBuilder({super.key, required this.postId});

  @override
  State<CommentsBuilder> createState() => _CommentsBuilderState();
}

class _CommentsBuilderState extends State<CommentsBuilder> {
  late Future<List<Comment>> postsData =
      PostsRepository().getCommentsById(widget.postId);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: postsData,
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingIndicator();
          } else if (snapshot.hasError) {
            return ErrorDescWidget(errorDesc: snapshot.error.toString());
          } else if (snapshot.connectionState == ConnectionState.done) {
            return CommentWidget(commentList: snapshot.data!.toList());
          }

          return const LoadingIndicator();
        }));
  }
}
