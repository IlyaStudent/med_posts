import 'package:flutter/material.dart';
import 'package:med_posts/features/posts/data/models/post_full_info.dart';
import 'package:med_posts/features/posts/presentation/widgets/comment_widget.dart';
import 'package:med_posts/features/posts/presentation/widgets/user_widget.dart';

class PostWidget extends StatelessWidget {
  final PostFullInfo post;
  const PostWidget({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserWidget(username: post.user.name, useremail: post.user.email),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(post.post.title.toUpperCase()),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(post.post.body),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: CommentWidget(commentList: post.commentsList)),
        const Divider(),
      ],
    );
  }
}
