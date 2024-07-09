import 'package:flutter/material.dart';
import 'package:med_posts/features/posts/data/models/post_comment.dart';

class CommentWidget extends StatelessWidget {
  final List<PostComment> commentList;
  const CommentWidget({super.key, required this.commentList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Комментарии: (${commentList.length}):"),
          Text(
            "${commentList.last.email}: \t${commentList.last.body}",
          ),
        ],
      ),
    );
  }
}
