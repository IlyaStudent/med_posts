import 'package:flutter/material.dart';
import 'package:med_posts/features/posts/data/models/post.dart';
import 'package:med_posts/features/posts/presentation/future_builders/comments_builder.dart';
import 'package:med_posts/features/posts/presentation/future_builders/user_builder.dart';

class PostWidget extends StatelessWidget {
  final Post post;
  const PostWidget({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserBuilder(userId: post.userId),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(post.title.toUpperCase()),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(post.body),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: CommentsBuilder(postId: post.id)),
        const Divider(),
      ],
    );
  }
}
